#import "AppCalculadoraImcPlugin.h"
#if __has_include(<app_calculadora_imc/app_calculadora_imc-Swift.h>)
#import <app_calculadora_imc/app_calculadora_imc-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "app_calculadora_imc-Swift.h"
#endif

@implementation AppCalculadoraImcPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppCalculadoraImcPlugin registerWithRegistrar:registrar];
}
@end
