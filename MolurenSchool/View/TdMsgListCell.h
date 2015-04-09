//
//  TdMsgListCell.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/9.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TdMessageUnion.h"

@interface TdMsgListCell : UITableViewCell
{
    UIImageView *_userHead;
    UIImageView *_bageView;
    UILabel *_bageNumber;
    UILabel *_userNickname;
    UILabel *_messageConent;
    UILabel *_timeLable;
    UIImageView *_cellBkg;
}

-(void)setUnionObject:(TdMessageUnion*)aUnionObj;
@property (nonatomic,retain) UIImageView *userHead;

@end