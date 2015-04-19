//
//  TdUserModel.h
//  MolurenSchool
//
//  Created by giantliu on 15/4/20.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define mUSER_ID @"userId"
#define mUSER_NICKNAME @"nickName"
#define mUSER_DESCRIPTION @"description"
#define mUSER_USERHEAD @"userHead"
#define mUSER_FRIEND_FLAG @"friendFlag"

@interface TdUserModel : NSObject

@property (nonatomic,retain) NSString* userId;
@property (nonatomic,retain) NSString* userNickname;
@property (nonatomic,retain) NSString* userDescription;
@property (nonatomic,retain) NSString* userHead;
@property (nonatomic,retain) NSNumber* friendFlag;



//数据库增删改查
+(BOOL)saveNewUser:(TdUserModel*)aUser;
+(BOOL)deleteUserById:(NSNumber*)userId;
+(BOOL)updateUser:(TdUserModel*)newUser;
+(BOOL)haveSaveUserById:(NSString*)userId;

+(NSMutableArray*)fetchAllFriendsFromLocal;

//将对象转换为字典
-(NSDictionary*)toDictionary;
+(TdUserModel*)userFromDictionary:(NSDictionary*)aDic;

@end