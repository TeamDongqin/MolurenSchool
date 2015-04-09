//
//  TdMsgListViewController.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/9.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TdMsgListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_msgArr;
    UITableView *_messageTable;
}

@end
