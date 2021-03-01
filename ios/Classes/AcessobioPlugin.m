#import "AcessobioPlugin.h"
#if __has_include(<acessobio_plugin/acessobio_plugin-Swift.h>)
#import <acessobio_plugin/acessobio_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "acessobio_plugin-Swift.h"
#endif

@implementation AcessobioPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAcessobioPlugin registerWithRegistrar:registrar];
}
@end
