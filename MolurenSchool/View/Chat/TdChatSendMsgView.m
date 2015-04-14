//
//  TdChatSendMsgView.m
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/14.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TdChatSendMsgView.h"

@implementation TdChatSendMsgView

@synthesize VoiceButton, EmojButton, MoreButton;

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.backgroundColor = [UIColor whiteColor];
    
    // Voice button
    UIImage *PowerButtonBgImage = [UIImage imageNamed:@"Topic_PowerButton_Off"];
    
    VoiceButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 7, 30, 30)];
    [VoiceButton setBackgroundImage:PowerButtonBgImage forState:UIControlStateNormal];
    [VoiceButton addTarget:self action:@selector(onVoiceButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:VoiceButton];
    
    // Emoj button
    EmojButton = [[UIButton alloc] initWithFrame:CGRectMake(252, 7, 30, 30)];
    [EmojButton setBackgroundImage:PowerButtonBgImage forState:UIControlStateNormal];
    [EmojButton addTarget:self action:@selector(onEmojButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:EmojButton];
    
    // More button
    MoreButton = [[UIButton alloc] initWithFrame:CGRectMake(283, 7, 30, 30)];
    [MoreButton setBackgroundImage:PowerButtonBgImage forState:UIControlStateNormal];
    [MoreButton addTarget:self action:@selector(onMoreButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:MoreButton];
}

-(void)onVoiceButtonClick{
    
}

-(void)onEmojButtonClick{
    
}

-(void)onMoreButtonClick{
    
}

@end
