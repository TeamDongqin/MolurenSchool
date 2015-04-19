//
//  CommonSetting.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/8.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <Foundation/Foundation.h>

// FMDB
#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); abort(); } }

#define DATABASE_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]stringByAppendingString:@"/weChat.db"]

// Api path
#define API_BASE_URL(_URL_) [NSURL URLWithString:[@"http://115.29.150.153/api/" stringByAppendingString:_URL_]]
#define FILE_BASE_URL(_FILE_) [NSURL URLWithString:[@"http://115.29.150.153/" stringByAppendingString:_FILE_]]

#define ServerHostName @"120.27.46.123"

// Portrait
#define HEAD_SIZE 50.0f
#define INSETS 8.0f

#define CELL_HEIGHT self.contentView.frame.size.height
#define CELL_WIDTH self.contentView.frame.size.width

// Xmpp server
#define DOCUMENT_PATH NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
#define CACHES_PATH NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]

@interface CommonSetting : NSObject

// Chat advanced feature view
#define CHAT_BUTTON_SIZE 70
#define INSETS 10

@end
