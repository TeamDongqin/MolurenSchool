//
//  TdMessageUnion.m
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/8.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TdMessageUnion.h"

@implementation TdMessageUnion : NSObject

@synthesize message,user;


+(TdMessageUnion *)unionWithMessage:(TdMessage *)aMessage andUser:(TdStudent *)aUser
{
    TdMessageUnion *unionObject=[[TdMessageUnion alloc]init];
    [unionObject setUser:aUser];
    [unionObject setMessage:aMessage];
    return unionObject;
}

@end
