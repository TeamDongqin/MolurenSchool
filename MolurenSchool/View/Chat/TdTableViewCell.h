//
//  TdTableViewCell.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/13.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TdMessage.h"

// Portrait size
#define HEAD_SIZE 50.0f
#define TEXT_MAX_HEIGHT 500.0f

// Insets
#define INSETS 8.0f

@interface TdTableViewCell : UITableViewCell
{
    UIImageView *_userHead;
    UIImageView *_bubbleBg;
    UIImageView *_headMask;
    UIImageView *_chatImage;
    UILabel *_messageConent;
}

@property (nonatomic) enum TdMessageCellStyle msgStyle;
@property (nonatomic) int height;

-(void)setMessageObject:(TdMessage*)aMessage;
-(void)setHeadImage:(NSURL*)headImage tag:(int)aTag;
-(void)setChatImage:(NSURL *)chatImage tag:(int)aTag;

-(void)setHeadImageTest;

@end