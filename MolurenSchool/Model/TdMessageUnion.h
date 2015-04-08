//
//  TdMessageUnion.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/8.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TdStudent.h"
#import "TdMessage.h"

@interface TdMessageUnion : NSObject

@property (nonatomic,retain) TdMessage* message;
@property (nonatomic,retain) TdStudent* user;

+(TdMessageUnion *)unionWithMessage:(TdMessage *)aMessage andUser:(TdStudent *)aUser;

@end
