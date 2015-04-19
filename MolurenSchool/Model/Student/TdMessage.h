//
//  TdMessage.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/8.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TdMessage : NSObject

@property (nonatomic,retain) NSString *messageFrom;
@property (nonatomic,retain) NSString *messageTo;
@property (nonatomic,retain) NSString *messageContent;
@property (nonatomic,retain) NSDate *messageDate;
@property (nonatomic,retain) NSNumber *messageType;
@property (nonatomic,retain) NSNumber *messageId;

+(TdMessage *)messageWithType:(int)aType;

-(NSDictionary*)toDictionary;
+(TdMessage*)messageFromDictionary:(NSDictionary*)aDic;

//Database operations
+(BOOL)save:(TdMessage*)aMessage;
+(BOOL)deleteMessageById:(NSNumber*)aMessageId;
+(BOOL)merge:(TdMessage*)aMessage;

// Fetch specified user chat history
+(NSMutableArray *)fetchMessageListWithUser:(NSString *)userId byPage:(int)pageIndex;

+(NSMutableArray *)fetchMessageListWithUserTest;

// Fetch recent contact
+(NSMutableArray *)fetchRecentChatByPage:(int)pageIndex;

@end
