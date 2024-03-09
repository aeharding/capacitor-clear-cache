import { registerPlugin } from '@capacitor/core';

import type { ClearCachePlugin } from './definitions';

const ClearCache = registerPlugin<ClearCachePlugin>('ClearCache', {
  web: () => import('./web').then(m => new m.ClearCacheWeb()),
});

export * from './definitions';
export { ClearCache };
