#import "LinkedinLoginPlugin.h"
#if __has_include(<linkedin_login/linkedin_login-Swift.h>)
#import <linkedin_login/linkedin_login-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "linkedin_login-Swift.h"
#endif

@implementation LinkedinLoginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLinkedinLoginPlugin registerWithRegistrar:registrar];
}
@end
