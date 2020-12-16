import * as crypto from 'crypto';

export const getHashFor = (obj: any) =>
  crypto.createHash('md5').update(JSON.stringify(obj)).digest('hex');
