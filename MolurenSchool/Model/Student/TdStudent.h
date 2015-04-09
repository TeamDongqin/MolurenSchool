//
//  TdStudent.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/8.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TdStudent : NSObject
@property (nonatomic,retain) NSString* userId;
@property (nonatomic,retain) NSString* userNickname;
@property (nonatomic,retain) NSString* userDescription;
@property (nonatomic,retain) NSString* userHead;
@property (nonatomic,retain) NSNumber* friendFlag;

//Database
+(BOOL)saveNewUser:(TdStudent*)aUser;
+(BOOL)deleteUserById:(NSNumber*)userId;
+(BOOL)updateUser:(TdStudent*)newUser;
+(BOOL)haveSaveUserById:(NSString*)userId;

+(NSMutableArray*)fetchAllFriendsFromLocal;

//Utility
-(NSDictionary*)toDictionary;
+(TdStudent*)userFromDictionary:(NSDictionary*)aDic;

@end
