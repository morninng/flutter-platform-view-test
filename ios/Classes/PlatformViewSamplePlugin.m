#import "PlatformViewSamplePlugin.h"
#if __has_include(<platform_view_sample/platform_view_sample-Swift.h>)
#import <platform_view_sample/platform_view_sample-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "platform_view_sample-Swift.h"
#endif

@implementation PlatformViewSamplePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPlatformViewSamplePlugin registerWithRegistrar:registrar];
}
@end
