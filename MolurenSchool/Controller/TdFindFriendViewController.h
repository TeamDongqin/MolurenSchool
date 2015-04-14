//
//  TdFindFriendViewController.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/12.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"

@interface TdFindFriendViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate,UISearchBarDelegate>

{
    NSMutableArray * _friendArray;
    NSString * searchKey;
    
    IBOutlet UITableView *_friendTable;
    
    IBOutlet UIWebView * web;
    
    IBOutlet UIView *findView;
    int _pageIndex;
    int _pageSize;
    
//    IBOutlet UIImageView *refreshView;
}

- (IBAction)searchUser:(id)sender;
- (IBAction)closeFind:(id)sender;
- (IBAction)webBack:(id)sender;

///最后加载的SEL
- (void)refrenshDataWithLastSEL;

@end
