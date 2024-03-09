export interface ClearCachePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
