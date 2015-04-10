//
//  TdChatDBManager.m
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/9.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TdChatDBManager.h"

@implementation TdChatDBManager

#pragma mark - Singleton method

+ (TdChatDBManager*)Instance
{
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

-(FMDatabase*)Init{
    
    self.TdDataBaseMgr = [FMDatabase databaseWithPath:DATABASE_PATH];
    
    return self.TdDataBaseMgr;
}

@end
