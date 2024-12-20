import Foundation
import Capacitor
import SafariServices

@objc(ClearCachePlugin)
public class ClearCachePlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "ClearCachePlugin" 
    public let jsName = "ClearCache" 
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "clear", returnType: CAPPluginReturnPromise),
    ] 
    @objc func clear(_ call: CAPPluginCall) {
        if #available(iOS 16.0, *) {
            SFSafariViewController.DataStore.default.clearWebsiteData { [weak self] in
                guard self != nil else { return }

                HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
                URLCache.shared.removeAllCachedResponses()

                if #available(iOS 17.0, *) {
                    WKWebsiteDataStore.default().removeData(ofTypes: [
                        WKWebsiteDataTypeCookies,
                        WKWebsiteDataTypeDiskCache,
                        WKWebsiteDataTypeMemoryCache,
                        WKWebsiteDataTypeFetchCache,
                        WKWebsiteDataTypeSessionStorage,
                        WKWebsiteDataTypeServiceWorkerRegistrations,
                        WKWebsiteDataTypeOfflineWebApplicationCache,

                        WKWebsiteDataTypeFileSystem,

                        WKWebsiteDataTypeSearchFieldRecentSearches,
                        WKWebsiteDataTypeHashSalt,
                        WKWebsiteDataTypeMediaKeys,
                    ], modifiedSince: Date(timeIntervalSince1970: 0), completionHandler: {
                        call.resolve()
                    })
                } else {
                    WKWebsiteDataStore.default().removeData(ofTypes: [
                        WKWebsiteDataTypeCookies,
                        WKWebsiteDataTypeDiskCache,
                        WKWebsiteDataTypeMemoryCache,
                        WKWebsiteDataTypeFetchCache,
                        WKWebsiteDataTypeSessionStorage,
                        WKWebsiteDataTypeServiceWorkerRegistrations,
                        WKWebsiteDataTypeOfflineWebApplicationCache,

                        WKWebsiteDataTypeFileSystem,
                    ], modifiedSince: Date(timeIntervalSince1970: 0), completionHandler: {
                        call.resolve()
                    })
                }
            }
        } else {
            WKWebsiteDataStore.default().removeData(ofTypes: [
                WKWebsiteDataTypeCookies,
                WKWebsiteDataTypeDiskCache,
                WKWebsiteDataTypeMemoryCache,
                WKWebsiteDataTypeFetchCache,
                WKWebsiteDataTypeSessionStorage,
                WKWebsiteDataTypeServiceWorkerRegistrations,
                WKWebsiteDataTypeOfflineWebApplicationCache
            ], modifiedSince: Date(timeIntervalSince1970: 0), completionHandler: {
                call.resolve()
            })
        }
    }
}
