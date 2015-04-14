//
//  TdUtilities.m
//  Moluren
//
//  Created by zheng lingshan on 15/3/28.
//  Copyright (c) 2015年 com.teamdongqin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TdUtilities.h"
#import "sys/utsname.h"

@interface TdUtilities()

//-() GetDeviceType{
//    
//}

@end

@implementation TdUtilities

#pragma mark - Singleton method

+ (TdUtilities*)Instance
{
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

-(DeviceType)GetDeviceType{
    DeviceType CurrentDeviceType = Device_Default;
    NSDictionary* deviceNamesByCode = nil;
    
    deviceNamesByCode = @{
                          @"iPhone3,1" :[NSNumber numberWithInt:Device_iPhone4],        //
                          @"iPhone4,1" :[NSNumber numberWithInt:Device_iPhone4s],       //
                          @"iPhone5,1" :[NSNumber numberWithInt:Device_iPhone5],        // (model A1428, AT&T/Canada)
                          @"iPhone5,2" :[NSNumber numberWithInt:Device_iPhone5],        // (model A1429, everything else)
                          @"iPhone5,3" :[NSNumber numberWithInt:Device_iPhone5c],       // (model A1456, A1532 | GSM)
                          @"iPhone5,4" :[NSNumber numberWithInt:Device_iPhone5c],       // (model A1507, A1516, A1526 (China), A1529 | Global)
                          @"iPhone6,1" :[NSNumber numberWithInt:Device_iPhone5s],       // (model A1433, A1533 | GSM)
                          @"iPhone6,2" :[NSNumber numberWithInt:Device_iPhone5s],       // (model A1457, A1518, A1528 (China), A1530 | Global)
                          @"iPhone7,1" :[NSNumber numberWithInt:Device_iPhone6Plus],
                          @"iPhone7,2" :[NSNumber numberWithInt:Device_iPhone6]
                          };
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString* code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    CurrentDeviceType = [[deviceNamesByCode objectForKey:code] integerValue];
    
    if (CurrentDeviceType == Device_Default) {
        CurrentDeviceType = Device_iPhone4s;  // Default
    }
    
    return CurrentDeviceType;
}

-(int)GetDeviceSendMsgViewHeight{
    int Height = 0.0f;
    DeviceType deviceType = [self GetDeviceType];
    switch (deviceType) {
        case Device_iPhone4:
        case Device_iPhone4s:
            {
                Height = 40.0f;
            }
            break;
        case Device_iPhone5:
        case Device_iPhone5c:
        case Device_iPhone5s:
        case Device_iPhone6:
        case Device_iPhone6Plus:
        case Device_Default:
        default:
            {
                Height = 45.0f;
            }
            break;
    }
    
    return Height;
}

@end