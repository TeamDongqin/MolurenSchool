//
//  TdStudent.m
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/8.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TdStudent.h"
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "TdChatDBManager.h"

@implementation TdStudent
@synthesize userDescription,userHead,userId,userNickname,friendFlag;

+(BOOL)saveNewUser:(TdStudent*)aUser
{
    
    
    FMDatabase *db = [[TdChatDBManager Instance] Init];
    if (![db open]) {
        NSLog(@"数据库打开失败");
        return NO;
    };
    
    [TdStudent checkTableCreatedInDb:db];
    
    
    
    NSString *insertStr=@"INSERT INTO 'wcUser' ('userId','nickName','description','userHead','friendFlag') VALUES (?,?,?,?,?)";
    BOOL worked = [db executeUpdate:insertStr,aUser.userId,aUser.userNickname,aUser.userDescription,aUser.userHead,aUser.friendFlag];
    // FMDBQuickCheck(worked);
    
    
    
    [db close];
    
    
    return worked;
}

+(BOOL)haveSaveUserById:(NSString*)userId
{
    
    FMDatabase *db = [[TdChatDBManager Instance] Init];
    if (![db open]) {
        NSLog(@"数据库打开失败");
        return YES;
    };
    [TdStudent checkTableCreatedInDb:db];
    
    FMResultSet *rs=[db executeQuery:@"select count(*) from wcUser where userId=?",userId];
    while ([rs next]) {
        int count= [rs intForColumnIndex:0];
        
        if (count!=0){
            [rs close];
            return YES;
        }else
        {
            [rs close];
            return NO;
        }
        
    };
    [rs close];
    return YES;
    
}
+(BOOL)deleteUserById:(NSNumber*)userId
{
    return NO;
    
}
+(BOOL)updateUser:(TdStudent*)newUser
{
    
    FMDatabase *db = [[TdChatDBManager Instance] Init];
    if (![db open]) {
        NSLog(@"数据库打开失败");
        return NO;
    };
    [TdStudent checkTableCreatedInDb:db];
    BOOL worked=[db executeUpdate:@"update wcUser set friendFlag=?, userHead=? ,nickName=? ,description=? where userId=?",newUser.friendFlag,newUser.userHead,newUser.userNickname,newUser.userDescription,newUser.userId];
    [db close];
    return worked;
    
}

+(NSMutableArray*)fetchAllFriendsFromLocal
{
    NSMutableArray *resultArr=[[NSMutableArray alloc]init];
    
    FMDatabase *db = [[TdChatDBManager Instance] Init];
    if (![db open]) {
        NSLog(@"数据库打开失败");
        return resultArr;
    };
    [TdStudent checkTableCreatedInDb:db];
    
    FMResultSet *rs=[db executeQuery:@"select * from wcUser where friendFlag=?",[NSNumber numberWithInt:1]];
    while ([rs next]) {
        TdStudent *user=[[TdStudent alloc]init];
        user.userId=[rs stringForColumn:kUSER_ID];
        user.userNickname=[rs stringForColumn:kUSER_NICKNAME];
        user.userHead=[rs stringForColumn:kUSER_USERHEAD];
        user.userDescription=[rs stringForColumn:kUSER_DESCRIPTION];
        user.friendFlag=[NSNumber numberWithInt:1];
        [resultArr addObject:user];
    }
    [rs close];
    [db close];
    return resultArr;
    
}

+(TdStudent*)userFromDictionary:(NSDictionary*)aDic
{
    TdStudent *user=[[TdStudent alloc]init];
    [user setUserId:[aDic objectForKey:kUSER_ID]];
    [user setUserHead:[aDic objectForKey:kUSER_USERHEAD]];
    [user setUserDescription:[aDic objectForKey:kUSER_DESCRIPTION]];
    [user setUserNickname:[aDic objectForKey:kUSER_NICKNAME]];
    return user;
}

-(NSDictionary*)toDictionary
{
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:userId,kUSER_ID,userNickname,kUSER_NICKNAME,userDescription,kUSER_DESCRIPTION,userHead,kUSER_USERHEAD,friendFlag,kUSER_FRIEND_FLAG, nil];
    return dic;
}


+(BOOL)checkTableCreatedInDb:(FMDatabase *)db
{
    NSString *createStr=@"CREATE  TABLE  IF NOT EXISTS 'wcUser' ('userId' VARCHAR PRIMARY KEY  NOT NULL  UNIQUE , 'nickName' VARCHAR, 'description' VARCHAR, 'userHead' VARCHAR,'friendFlag' INT)";
    
    BOOL worked = [db executeUpdate:createStr];
    FMDBQuickCheck(worked);
    return worked;
    
}

@end