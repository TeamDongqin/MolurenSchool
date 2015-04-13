//
//  TdAdvancedChatFeatureView.h
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/13.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TdAdvancedChatFeatureDelegate <NSObject>

@optional

-(void)pickPhoto;

@end

@interface TdAdvancedChatFeatureView : UIView

@property (nonatomic,assign) id<TdAdvancedChatFeatureDelegate> delegate;
@property (nonatomic,retain) UIButton *photoButton;
@property (nonatomic,retain) UIButton *cameraButton;
@property (nonatomic,retain) UIButton *locationButton;
@property (nonatomic,retain) UIButton *vcardButton;
@property (nonatomic,retain) UIButton *voipChatButton;
@property (nonatomic,retain) UIButton *videoChatButton;
@property (nonatomic,retain) UIButton *voidInputButton;
@property (nonatomic,retain) UIButton *moreButton;

@end
