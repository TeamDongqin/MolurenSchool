//
//  TdChatDBManager.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/9.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface TdChatDBManager : NSObject

@property (strong, atomic) FMDatabase* TdDataBaseMgr;

+ (TdChatDBManager*)Instance;

-(FMDatabase*)Init;

@end
