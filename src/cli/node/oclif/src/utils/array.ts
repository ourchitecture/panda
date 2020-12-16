export const getFirstMatch = (a: any[], b: any[]) => {
  return a[a.findIndex((item) => b.indexOf(item) >= 0)];
};
