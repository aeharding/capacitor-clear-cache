import { WebPlugin } from '@capacitor/core';

import type { ClearCachePlugin } from './definitions';

export class ClearCacheWeb extends WebPlugin implements ClearCachePlugin {
  async clear(): Promise<void> {
    this.unavailable('Not available on web platform');
  }
}
