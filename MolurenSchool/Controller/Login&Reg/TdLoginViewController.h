//
//  TdLoginViewController.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/14.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TdChatViewController.h"

@interface TdLoginViewController : UIViewController
{
    UIImageView *_userHead;
    UILabel *_userLoginName;
    UITextField *_userPassword;
    UIButton *_loginButton;
    UIButton *_registerButton;
    UINavigationController *mainTab;
    UITextField *modifiedLoginName;
    //WCUserProfileViewController *myProfile;
    
}

- (void)registerAccount:(id)sender;
- (void)shiftAccount:(id)sender;
- (void)startLogin:(id)sender;

@end
