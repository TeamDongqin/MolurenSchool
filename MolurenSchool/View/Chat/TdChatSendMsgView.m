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

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        UIImage *bgImage = [[UIImage imageNamed:@"ChatSendMsgBgImg"] resizableImageWithCapInsets:UIEdgeInsetsMake(2.0f, 0.0f, 0.0f, 0.0f)];
        self.backgroundColor = [UIColor colorWithPatternImage:bgImage];
        
        // Voice button
        UIImage *ChatVoiceToolImg = [UIImage imageNamed:@"ChatVoiceTool"];
        
        VoiceButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 7, 30, 30)];
        [VoiceButton setBackgroundImage:ChatVoiceToolImg forState:UIControlStateNormal];
        [VoiceButton addTarget:self action:@selector(onVoiceButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:VoiceButton];
        
        // Emoj button
        UIImage *ChatEmotionToolImg = [UIImage imageNamed:@"ChatEmotionTool"];
        
        EmojButton = [[UIButton alloc] initWithFrame:CGRectMake(252, 7, 30, 30)];
        [EmojButton setBackgroundImage:ChatEmotionToolImg forState:UIControlStateNormal];
        [EmojButton addTarget:self action:@selector(onEmojButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:EmojButton];
        
        // More button
        UIImage *ChatMoreToolImg = [UIImage imageNamed:@"ChatMoreTool"];
        
        MoreButton = [[UIButton alloc] initWithFrame:CGRectMake(283, 7, 30, 30)];
        [MoreButton setBackgroundImage:ChatMoreToolImg forState:UIControlStateNormal];
        [MoreButton addTarget:self action:@selector(onMoreButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:MoreButton];
    }
    
    return self;
}

-(void)onVoiceButtonClick{
    
}

-(void)onEmojButtonClick{
    
}

-(void)onMoreButtonClick{
    
}

@end
