//
//  TDFoundationCommon.m
//  MolurenSchool
//
//  Created by tcl-macpro on 15/4/26.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TDFoundationCommon.h"

@implementation TDFoundationCommon

+ (CGFloat)getAdapterHeight {
    CGFloat adapterHeight = 0;
    if ([[[UIDevice currentDevice] systemVersion] integerValue] < 7.0) {
        adapterHeight = 44;
    }
    return adapterHeight;
}

@end
