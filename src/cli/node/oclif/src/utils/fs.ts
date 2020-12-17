import * as fs from 'fs';
import * as path from 'path';
import * as util from 'util';

import { getFirstMatch } from './array';
import { getHashFor } from './crypto';

export const readFile = util.promisify(fs.readFile);
export const readDirectoryFileNames = util.promisify(fs.readdir);

export const pathExists = (filePath: string) => {
  return new Promise<boolean>((resolve, reject) => {
    fs.access(filePath, fs.constants.F_OK, (err) => {
      // console.log(`Searching for file ${filePath}`);

      if (err) {
        if (err.errno === -2) {
          resolve(false);
        } else {
          reject(err);
        }
        return;
      }

      resolve(true);
    });
  });
};

export const getDirectoryFilesHash = async (directoryPath: string) => {
  const fileNames = await readDirectoryFileNames(directoryPath);
  return getHashFor(fileNames);
};

type FindFileUpSearchResult = {
  exists: boolean;
  path: string | undefined;
};

export const findFirstFileUp = async (
  fileNames: string[]
): Promise<FindFileUpSearchResult> => {
  let parentDirExists = true;
  let currentDirPath = './';

  while (parentDirExists) {
    const currentDirFileNames = await readDirectoryFileNames(currentDirPath);

    const firstMatchFileName = getFirstMatch(fileNames, currentDirFileNames);

    if (firstMatchFileName) {
      const firstMatchFilePath = path.join(currentDirPath, firstMatchFileName);

      return { exists: true, path: firstMatchFilePath };
    }

    const currentDirContentHash = await getDirectoryFilesHash(currentDirPath);
    const parentDirPath = path.join('../', currentDirPath);
    const parentDirContentHash = await getDirectoryFilesHash(parentDirPath);

    // console.log('currentDirPath', currentDirPath);
    // console.log('parentDirPath', parentDirPath);

    currentDirPath = parentDirPath;
    parentDirExists = currentDirContentHash != parentDirContentHash;
  }

  return { exists: false, path: undefined };
};
