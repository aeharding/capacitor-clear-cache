import { WebPlugin } from '@capacitor/core';

import type { ClearCachePlugin } from './definitions';

export class ClearCacheWeb extends WebPlugin implements ClearCachePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
