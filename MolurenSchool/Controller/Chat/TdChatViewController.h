//
//  TdChatViewController.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/13.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TdAdvancedChatFeatureView.h"
#import "TdStudent.h"
#import "TdChatSendMsgView.h"

@interface TdChatViewController : UIViewController<UINavigationControllerDelegate>
{
    IBOutlet UITableView *msgRecordTable;
    NSMutableArray *msgRecords;
    IBOutlet UITextField *messageText;
    IBOutlet UIView *inputBar;
    //UIImage *_myHeadImage,*_userHeadImage;
    TdAdvancedChatFeatureView *_shareMoreView;
    TdChatSendMsgView* SendMsgView;
}
- (IBAction)sendIt:(id)sender;
- (IBAction)shareMore:(id)sender;
@property (nonatomic,retain) TdStudent *chatPerson;

@end