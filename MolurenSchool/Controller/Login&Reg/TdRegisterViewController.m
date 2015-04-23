//
//  TdRegisterViewController.m
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/17.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TdRegisterViewController.h"
#import "ASIFormDataRequest.h"
#import "MMProgressHUD.h"
#import "SBJsonParser.h"

@interface TdRegisterViewController ()

@property (nonatomic, strong) UIView *LoginNumberVIew;
@property (nonatomic, strong) UIView *LoginPassView;
@property (nonatomic, strong) UITextField *UserLoginName;
@property (nonatomic, strong) UITextField *UserPwd;
@property (nonatomic, strong) UITextField *UserNickName;
@property (nonatomic, strong) UITextField *UserDescription;
@property (nonatomic, strong) UIButton *UserPortrait;
@property (nonatomic, strong) UILabel* Intro;
@property (nonatomic, strong) UIImageView* CountrySelectionView;
@property (nonatomic, strong) UIImageView* CountryNumberView;
@property (nonatomic, strong) UILabel* Label1;
@property (nonatomic, strong) UILabel* Label2;
@property (nonatomic, strong) UILabel* Label3;
@property (nonatomic, strong) UIImageView* RightIndicator;

@end

@implementation TdRegisterViewController

@synthesize LoginNumberVIew, LoginPassView, UserLoginName, UserPwd, UserNickName, UserDescription,
            UserPortrait, Intro, CountrySelectionView, Label1, Label2, Label3, RightIndicator, CountryNumberView;

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(COLOR_REGISTERGB);
    
    // User login name
    UserLoginName = [[UITextField alloc]initWithFrame:CGRectInset(self.view.bounds, 15, 0)];
    UserLoginName.placeholder = @"请填写手机号码";
    UserLoginName.delegate = self;
    
    [self.view addSubview:UserLoginName];
    
    // Intro
    Intro = [[UILabel alloc] init];
    Intro.text = @"请确认你的国家或地区并输入手机号";
    Intro.textColor = UIColorFromRGB(0x65676C);
    Intro.textAlignment = UITextAlignmentCenter;
    Intro.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
    
    [self.view addSubview:Intro];
    
    // Background image
    UIImage* BgImg = [[UIImage imageNamed:@"BtnTemplate_DefaultWhite"] stretchableImageWithLeftCapWidth:9 topCapHeight:9];
    
    // Country selection view
    Label1 = [[UILabel alloc] init];
    Label1.text = @"国家和地区";
    Label1.textColor = UIColorFromRGB(0x65676C);
    Label1.textAlignment = UITextAlignmentLeft;
    Label1.font = [UIFont fontWithName:@"Helvetica Neue" size:19];
    
    Label2 = [[UILabel alloc] init];
    Label2.text = @"新加坡";
    Label2.textColor = [UIColor blackColor];
    Label2.textAlignment = UITextAlignmentLeft;
    Label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:19];
    
    RightIndicator = [[UIImageView alloc] init];
    RightIndicator.image = [UIImage imageNamed:@"RightIndicator"];
    
    CountrySelectionView = [[UIImageView alloc] init];
    CountrySelectionView.image = BgImg;
    
    
    [CountrySelectionView addSubview:Label1];
    [CountrySelectionView addSubview:Label2];
    [CountrySelectionView addSubview:RightIndicator];
    
    [self.view addSubview:CountrySelectionView];
    
    // Country number view
    
    Label3 = [[UILabel alloc] init];
    Label3.text = @"+65";
    Label3.textColor = [UIColor blackColor];
    Label3.textAlignment = UITextAlignmentCenter;
    Label3.font = [UIFont fontWithName:@"Helvetica-Bold" size:19];
    
    CountryNumberView = [[UIImageView alloc] init];
    CountryNumberView.image = BgImg;
    
    [CountryNumberView addSubview:Label3];
    
    [self.view addSubview:CountryNumberView];
    
    [self ApplyConstraints];
}

-(void)ApplyConstraints{
    // Intro
    [Intro setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:Intro attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:289]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:Intro attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:Intro attribute:NSLayoutAttributeCenterX
        relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:Intro attribute:NSLayoutAttributeTop
        relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:10+NavigationBar_Height]];
    
    // Country selection view
    
    [Label1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:Label1 attribute:NSLayoutAttributeLeading
        relatedBy:NSLayoutRelationEqual toItem:CountrySelectionView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:Label1 attribute:NSLayoutAttributeCenterY
        relatedBy:NSLayoutRelationEqual toItem:CountrySelectionView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [Label2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:Label2 attribute:NSLayoutAttributeTrailing
        relatedBy:NSLayoutRelationEqual toItem:CountrySelectionView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-30]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:Label2 attribute:NSLayoutAttributeCenterY
        relatedBy:NSLayoutRelationEqual toItem:CountrySelectionView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [CountrySelectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:CountrySelectionView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:289]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:CountrySelectionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:43]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:CountrySelectionView attribute:NSLayoutAttributeCenterX
        relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:CountrySelectionView attribute:NSLayoutAttributeTop
        relatedBy:NSLayoutRelationEqual toItem:Intro attribute:NSLayoutAttributeBottom multiplier:1.0 constant:12]];
    
    [Label3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:Label3 attribute:NSLayoutAttributeCenterX
        relatedBy:NSLayoutRelationEqual toItem:CountryNumberView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:Label3 attribute:NSLayoutAttributeCenterY
        relatedBy:NSLayoutRelationEqual toItem:CountryNumberView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [CountryNumberView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:CountryNumberView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:80]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:CountryNumberView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:43]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:CountryNumberView attribute:NSLayoutAttributeLeading
        relatedBy:NSLayoutRelationEqual toItem:CountrySelectionView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:CountryNumberView attribute:NSLayoutAttributeTop
        relatedBy:NSLayoutRelationEqual toItem:CountrySelectionView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:12]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Register

- (void)startRegister
{
    if (UserLoginName.text.length!=11) {
        UIAlertView *av= [[UIAlertView alloc]initWithTitle:@"请求被阻止" message:@"请填写11位手机号码" delegate:nil cancelButtonTitle:@"哦。" otherButtonTitles: nil];
        [av show];
        return;
    }
    if (UserNickName.text.length==0) {
        UIAlertView *av= [[UIAlertView alloc]initWithTitle:@"请求被阻止" message:@"请填写昵称" delegate:nil cancelButtonTitle:@"哦。" otherButtonTitles: nil];
        [av show];
        return;
    }
    if (UserDescription.text.length==0) {
        UIAlertView *av= [[UIAlertView alloc]initWithTitle:@"请求被阻止" message:@"请填写个性签名" delegate:nil cancelButtonTitle:@"哦。" otherButtonTitles: nil];
        [av show];
        return;
    }
    if (UserPwd.text.length<6) {
        UIAlertView *av= [[UIAlertView alloc]initWithTitle:@"请求被阻止" message:@"请设置6位以上的用户密码" delegate:nil cancelButtonTitle:@"哦。" otherButtonTitles: nil];
        [av show];
        return;
    }
    
    
    __block NSString *fileId=@"";
    //先上传头像
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:API_BASE_URL(@"uploadFile.do")];
    [request setData:UIImageJPEGRepresentation(UserPortrait.imageView.image,0.01) withFileName:[UserLoginName.text stringByAppendingString:@"-head.jpg"] andContentType:@"image/jpeg" forKey:@"file"];
    [request setTimeOutSeconds:1000];
    
    [MMProgressHUD showWithTitle:@"上传头像" status:@"头像上传中，请耐心等待"];
    [request setCompletionBlock:^{
        SBJsonParser *paser=[[SBJsonParser alloc]init];
        
        NSDictionary *rootDic=[paser objectWithString:request.responseString];
        NSArray *files=[rootDic objectForKey:@"files"];
        if ([files count]>0) {
            fileId=[[files objectAtIndex:0] objectForKey:@"fileId"];
        }
        [MMProgressHUD dismissWithSuccess:@"上传头像成功" title:fileId afterDelay:1.0f];
        [self continueRegister:fileId];
        
    }];
    [request setFailedBlock:^{
        [MMProgressHUD dismissWithError:@"上传头像失败" afterDelay:1.0f];
        [self continueRegister:fileId];
    }];
    [request startAsynchronous];
    
    
}


-(void)continueRegister:(NSString*)fileId
{
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:API_BASE_URL(@"register.do")];
    [request setPostValue:UserLoginName.text forKey:@"mobile"];
    [request setPostValue:UserPwd.text forKey:@"uPass"];
    [request setPostValue:UserNickName.text forKey:@"nickName"];
    [request setPostValue:UserDescription.text forKey:@"description"];
    [request setPostValue:fileId forKey:@"userHead"];
    [MMProgressHUD showWithTitle:@"开始注册" status:@"注册中..." ];
    [request setCompletionBlock:^{
        SBJsonParser *paser=[[SBJsonParser alloc]init];
        NSLog(@"%@",request.responseString);
        NSDictionary *rootDic=[paser objectWithString:request.responseString];
        int status=[[rootDic objectForKey:@"status"]intValue];
        if (status==1) {
            [MMProgressHUD dismissWithSuccess:[rootDic objectForKey:@"msg"] title:@"注册成功" afterDelay:0.75f];
            NSDictionary *userDic=[rootDic objectForKey:@"userInfo"];
            [[NSUserDefaults standardUserDefaults]setObject:[rootDic objectForKey:@"apiKey"] forKey:kMY_API_KEY];
            [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"userId"] forKey:kMY_USER_ID];
            [[NSUserDefaults standardUserDefaults]setObject:UserLoginName.text forKey:kMY_USER_LoginName];
            [[NSUserDefaults standardUserDefaults]setObject:UserPwd.text forKey:kMY_USER_PASSWORD];
            [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"userHead"] forKey:kMY_USER_Head];
            [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"userNickname"] forKey:kMY_USER_NICKNAME];
            //立刻保存信息
            [[NSUserDefaults standardUserDefaults]synchronize];
            [self.navigationController dismissViewControllerAnimated:YES completion:Nil];
            
            
        }
        else
        {
            [MMProgressHUD dismissWithError:[rootDic objectForKey:@"msg"] title:@"注册失败" afterDelay:0.75f];
        }
        
        
        
    }];
    [request setFailedBlock:^{
        [MMProgressHUD dismissWithError:@"链接服务器失败！" title:@"注册失败" afterDelay:0.75f];
    }];
    
    
    
    [request startAsynchronous];
    
}

#pragma mark - User operations

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)nextStep:(id)sender{
    if (LoginNumberVIew.superview==self.view) {
        [LoginNumberVIew removeFromSuperview];
        [self.view addSubview:LoginPassView];
    }else
    {
        [self startRegister];
    }
    
}

- (IBAction)changeUserHead:(id)sender {
    UIActionSheet *as=[[UIActionSheet alloc]initWithTitle:@"上传头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"马上照一张" otherButtonTitles:@"从相册中搞一张", nil ];
    [as showInView:self.view];
    
}

#pragma mark - ActionSheet delegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"用户点击的是第%d个按钮",buttonIndex);
    switch (buttonIndex) {
        case 0:// Camera
        {
            UIImagePickerController *imgPicker=[[UIImagePickerController alloc]init];
            [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            [imgPicker setDelegate:self];
            [imgPicker setAllowsEditing:YES];
            [self.navigationController presentViewController:imgPicker animated:YES completion:^{
            }];
            
            
            
        }
            break;
        case 1:// Select
        {
            UIImagePickerController *imgPicker=[[UIImagePickerController alloc]init];
            [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [imgPicker setDelegate:self];
            [imgPicker setAllowsEditing:YES];
            [self.navigationController presentViewController:imgPicker animated:YES completion:^{
            }];
            
            
            
            break;
        }
        default:
            break;
    }
    
    
}

#pragma mark - UIImagePickerController delegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage  * userHeadImage=[info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        //
        CATransition *trans=[CATransition animation];
        [trans setDuration:0.25f];
        [trans setType:@"flip"];
        [trans setSubtype:kCATransitionFromLeft];
        [UserPortrait.imageView.layer addAnimation:trans forKey:nil];
        
        [UserPortrait.imageView setImage:userHeadImage];
    }];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        //
    }];
}

@end