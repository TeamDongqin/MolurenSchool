//
//  TdAdvancedChatFeatureView.m
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/13.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TdAdvancedChatFeatureView.h"

@implementation TdAdvancedChatFeatureView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self setBackgroundColor:[UIColor whiteColor]];
    
    
    // Initialization code
    _photoButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [_photoButton setFrame:CGRectMake(INSETS, INSETS, CHAT_BUTTON_SIZE , CHAT_BUTTON_SIZE)];
    [_photoButton setImage:[UIImage imageNamed:@"sharemore_pic"] forState:UIControlStateNormal];
    [_photoButton addTarget:self action:@selector(pickPhoto) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_photoButton];
}

-(void)pickPhoto
{
    [_delegate pickPhoto];
}

@end
