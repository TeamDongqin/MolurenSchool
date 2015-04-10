//
//  TdServerManager.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/10.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//
//
//#import <Foundation/Foundation.h>
//#import <QuartzCore/QuartzCore.h>
//#import "XMPPFramework.h"
//
//@class XMPPMessage,XMPPRoster,XMPPRosterCoreDataStorage;
//@interface TdServerManager : NSObject<UIApplicationDelegate>
//{
//    XMPPStream *xmppStream;
//    XMPPReconnect *xmppReconnect;
//    XMPPRoster *xmppRoster;
//    XMPPRosterCoreDataStorage *xmppRosterStorage;
//    
//   	NSString *password;
//    
//    BOOL allowSelfSignedCertificates;
//    BOOL allowSSLHostNameMismatch;
//    
//    BOOL isXmppConnected;
//    
//    
//}
//
//- (NSManagedObjectContext *)managedObjectContext_roster;
//@property (readonly, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (readonly, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property (readonly, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//- (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;
//
//- (BOOL)connect;
//- (void)disconnect;
//
//+ (TdServerManager*)Instance;
//
//#pragma mark - Set up xml stream
//
//- (void)setupStream;
//- (void)teardownStream;
//
//
//#pragma mark - Receive & send message
//- (void)goOnline;
//- (void)goOffline;
//
//- (void)sendMessage:(XMPPMessage *)aMessage;
//- (void)addSomeBody:(NSString *)userId;
//
//
//#pragma mark - File Transfer
//-(void)sendFile:(NSData*)aData toJID:(XMPPJID*)aJID;
//
//@end
