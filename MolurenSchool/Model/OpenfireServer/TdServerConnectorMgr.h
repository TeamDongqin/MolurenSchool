//
//  TdServerManager.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/10.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.


#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "XMPPFramework.h"

@class XMPPMessage,XMPPRoster,XMPPRosterCoreDataStorage;
@interface TdServerConnectorMgr : NSObject<UIApplicationDelegate>
{
    XMPPStream *xmppStream;
    XMPPReconnect *xmppReconnect;
    XMPPRoster *xmppRoster;
    XMPPRosterCoreDataStorage *xmppRosterStorage;
    
   	NSString *password;
    
    BOOL allowSelfSignedCertificates;
    BOOL allowSSLHostNameMismatch;
    
    BOOL isXmppConnected;
    
    
}

@property (readonly, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (TdServerConnectorMgr*)Instance;

// Init
-(void)Init;

- (NSManagedObjectContext *)managedObjectContext_roster;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (BOOL)connect;
- (BOOL)disconnect;

-(void)Login:(NSString*)UserName withPassword:(NSString*)Password;
-(void)Register:(NSString*)UserName withPassword:(NSString*)Password;

// Set up xml stream
- (void)setupStream;
- (void)teardownStream;


// Receive & send message
- (void)goOnline;
- (void)goOffline;

- (void)sendMessage:(XMPPMessage *)aMessage;
- (void)addSomeBody:(NSString *)userId;


// File Transfer
-(void)sendFile:(NSData*)aData toJID:(XMPPJID*)aJID;

// Register
-(void)ProcessRegisterRequest;

@end
