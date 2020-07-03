#import "DevicePlugin.h"

@implementation DevicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"device"
            binaryMessenger:[registrar messenger]];
  DevicePlugin* instance = [[DevicePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if([@"getElectricity" isEqualToString:call.method]){
      [UIDevice currentDevice].batteryMonitoringEnabled = YES;
      result([NSString stringWithFormat:@"%f",[[UIDevice currentDevice] batteryLevel]]);
      //result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] batteryLevel]]);
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
