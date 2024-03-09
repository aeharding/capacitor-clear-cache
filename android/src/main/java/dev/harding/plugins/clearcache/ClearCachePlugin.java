package dev.harding.plugins.clearcache;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "ClearCache")
public class ClearCachePlugin extends Plugin {

    @PluginMethod
    public void clear(PluginCall call) {
        call.unimplemented("Clearing cache is not implemented on Android");
    }
}
