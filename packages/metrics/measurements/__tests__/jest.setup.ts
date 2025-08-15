import 'jest';
jest.mock('mmmagic', () => {
  return {
    Magic: function () {
      return {
        detect: (_buf: any, cb: (err: any, result?: any) => void) => cb(null, 'application/octet-stream')
      };
    }
  };
});
