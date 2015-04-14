//
//  CommonData.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/8.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#ifndef MolurenSchool_CommonData_h
#define MolurenSchool_CommonData_h

// User
#define kUSER_ID @"userId"
#define kUSER_NICKNAME @"nickName"
#define kUSER_DESCRIPTION @"description"
#define kUSER_USERHEAD @"userHead"
#define kUSER_FRIEND_FLAG @"friendFlag"

// User info
#define kMY_USER_ID @"myUserId"
#define kMY_API_KEY @"myApiKey"
#define kMY_USER_PASSWORD @"myUserPassword"
#define kMY_USER_DESC @"myUserDescription"
#define kMY_USER_NICKNAME @"myUserNickname"
#define kMY_USER_Head @"myUserHead"
#define kMY_USER_LoginName @"myUserLoginName"
#define kXMPPHost @"www.hcios.com"
#define kXMPPmyJID @"myXmppJid"
#define kXMPPmyPassword @"myXmppPassword"
#define kXMPPNewMsgNotifaction @"xmppNewMsgNotifaction"

// Message
#define kMESSAGE_TYPE @"messageType"
#define kMESSAGE_FROM @"messageFrom"
#define kMESSAGE_TO @"messageTo"
#define kMESSAGE_CONTENT @"messageContent"
#define kMESSAGE_DATE @"messageDate"
#define kMESSAGE_ID @"messageId"

// Message type
enum TdMessageType {
    kWCMessageTypePlain = 0,
    kWCMessageTypeImage = 1,
    kWCMessageTypeVoice =2,
    kWCMessageTypeLocation=3
};

enum TdMessageCellStyle {
    TdMessageCellStyleMe = 0,
    TdMessageCellStyleOther = 1,
    TdMessageCellStyleMeWithImage=2,
    TdMessageCellStyleOtherWithImage=3
};

// Device parameters
#define Device_Width [[UIScreen mainScreen] bounds].size.width
#define Device_Height [[UIScreen mainScreen] bounds].size.height

// Device type
typedef enum {
    Device_Default,
    Device_iPhone4,
    Device_iPhone4s,
    Device_iPhone5c,
    Device_iPhone5,
    Device_iPhone5s,
    Device_iPhone6,
    Device_iPhone6Plus
} DeviceType;


#endif
