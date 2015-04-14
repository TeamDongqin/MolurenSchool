//
//  TdChatSendMsgView.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/14.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TdChatSendMsgDelegate <NSObject>

@optional

-(void)pickPhoto;

@end

@interface TdChatSendMsgView : UIView

@property (nonatomic,assign) id<TdChatSendMsgDelegate> delegate;

@property (nonatomic,retain) UIButton *VoiceButton;
@property (nonatomic,retain) UIButton *EmojButton;
@property (nonatomic,retain) UIButton *MoreButton;

@end