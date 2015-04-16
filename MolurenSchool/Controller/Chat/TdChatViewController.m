//
//  TdChatViewController.m
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/13.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TdChatViewController.h"
#import "TdAdvancedChatFeatureView.h"
#import "TdServerManager.h"
#import "TdMessage.h"
#import "TdTableViewCell.h"

#import "XMPPMessage.h"
#import "ASIFormDataRequest.h"
#import "MMProgressHUD.h"
#import "SBJsonParser.h"
#import "NSObject+SBJson.h"

@implementation TdChatViewController

#pragma mark - View life cycle

-(void)viewDidLoad{
    [super viewDidLoad];

    self.navigationItem.title=_chatPerson.userNickname;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(newMsgCome:) name:kXMPPNewMsgNotifaction object:nil];
    
    // Initialize table view
    msgRecordTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Device_Width, Device_Height) style:UITableViewStyleGrouped];
    msgRecordTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    //[_messageTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    msgRecordTable.scrollEnabled = YES;
    msgRecordTable.dataSource = self;
    msgRecordTable.delegate = self;
    
    [self.view addSubview:msgRecordTable];
    
    SendMsgView = [[TdChatSendMsgView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - [[TdUtilities Instance] GetDeviceSendMsgViewHeight], Device_Width, [[TdUtilities Instance]GetDeviceSendMsgViewHeight])];
    
    SendMsgView.delegate = self;
    SendMsgView.autoresizesSubviews = YES;
    [self.view addSubview:SendMsgView];
    
    [self refresh];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        //        _myHeadImage=[[UIImage imageWithData:[NSData dataWithContentsOfURL:FILE_BASE_URL([[NSUserDefaults standardUserDefaults]objectForKey:kMY_USER_Head]])]retain];
        //        _userHeadImage=[[UIImage imageWithData:[NSData dataWithContentsOfURL:FILE_BASE_URL([[NSUserDefaults standardUserDefaults]objectForKey:_chatPerson.userHead]])]retain];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [msgRecordTable reloadData];
        });
    });
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [msgRecordTable addGestureRecognizer:tap];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeKeyBoard:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [msgRecordTable setBackgroundView:nil];
    //[msgRecordTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    
    
    _shareMoreView =[[TdAdvancedChatFeatureView alloc]init];
    [_shareMoreView setFrame:CGRectMake(0, 0, 320, 170)];
    [_shareMoreView setDelegate:self];
}

-(void)refresh
{
    [messageText setInputView:nil];
    [messageText resignFirstResponder];
    msgRecords =[TdMessage fetchMessageListWithUser:_chatPerson.userId byPage:1];
    
    // Test
    if (msgRecords.count == 0) {
        msgRecords = [TdMessage fetchMessageListWithUserTest];
    }
    
    if (msgRecords.count!=0) {
        [msgRecordTable reloadData];
        
        [msgRecordTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:msgRecords.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Keyboard handlings

// Hide keyboard when tap
-(void)handleTap:(UIGestureRecognizer *)gesture
{
    [self.view endEditing:YES];
}

-(void)changeKeyBoard:(NSNotification *)aNotifacation
{
    //获取到键盘frame 变化之前的frame
    NSValue *keyboardBeginBounds=[[aNotifacation userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect=[keyboardBeginBounds CGRectValue];
    
    //获取到键盘frame变化之后的frame
    NSValue *keyboardEndBounds=[[aNotifacation userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect endRect=[keyboardEndBounds CGRectValue];
    
    CGFloat deltaY=endRect.origin.y-beginRect.origin.y;
    //拿frame变化之后的origin.y-变化之前的origin.y，其差值(带正负号)就是我们self.view的y方向上的增量
    
    NSLog(@"deltaY:%f",deltaY);
    [CATransaction begin];
    [UIView animateWithDuration:0.4f animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY, self.view.frame.size.width, self.view.frame.size.height)];
        [msgRecordTable setContentInset:UIEdgeInsetsMake(msgRecordTable.contentInset.top-deltaY, 0, 0, 0)];
        
    } completion:^(BOOL finished) {
        
    }];
    [CATransaction commit];
    
}

#pragma mark - User operations

- (IBAction)sendIt:(id)sender {
    
    // NSLog(@"消息发送成功");
    NSString *message = messageText.text;
    
    
    
    
    NSDictionary *messageDic=[NSDictionary dictionaryWithObjectsAndKeys:@"",@"file",[NSNumber numberWithInt:kWCMessageTypePlain],@"messageType", message,@"text", nil];
    NSString *msgJson=[messageDic JSONRepresentation];
    NSLog(@"发送json:%@",msgJson);
    //生成消息对象
    XMPPMessage *mes=[XMPPMessage messageWithType:@"chat" to:[XMPPJID jidWithUser:[NSString stringWithFormat:@"%@",_chatPerson.userId] domain:@"hcios.com" resource:@"ios"]];
    [mes addChild:[DDXMLNode elementWithName:@"body" stringValue:msgJson]];
    
    //发送消息
    [[TdServerManager Instance] sendMessage:mes];
    
    [messageText setText:nil];
    
    
    
    
    
    
}


-(void)sendImage:(UIImage *)aImage
{
    NSLog(@"准备发送图片");
    //先上传头像
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:API_BASE_URL(@"uploadFile.do")];
    [request setData:UIImageJPEGRepresentation(aImage, 0.1) withFileName:@"chatFile.jpg" andContentType:@"image/jpeg" forKey:@"file"];
    [request setPostValue:[[NSUserDefaults standardUserDefaults]objectForKey:kMY_API_KEY] forKey:@"apiKey"];
    [request setTimeOutSeconds:1000];
    
    [MMProgressHUD showWithTitle:@"发送文件ing..." status:@"发送文件ing...，请耐心等待"];
    [request setCompletionBlock:^{
        NSDictionary *fileDic=[NSDictionary dictionary];
        SBJsonParser *paser=[[SBJsonParser alloc]init];
        
        NSDictionary *rootDic=[paser objectWithString:request.responseString];
        NSArray *files=[rootDic objectForKey:@"files"];
        if ([files count]>0) {
            fileDic=[files objectAtIndex:0];
        }
        [MMProgressHUD dismissWithSuccess:@"发送成功，干吧得" title:nil afterDelay:1.0f];
        
        NSDictionary *messageDic=[NSDictionary dictionaryWithObjectsAndKeys:fileDic,@"file",[NSNumber numberWithInt:kWCMessageTypeImage],@"messageType",@"",@"text", nil];
        NSString *msgJson=[messageDic JSONRepresentation];
        // NSLog(@"准备发送JSON:%@",msgJson);
        //生成消息对象
        XMPPMessage *mes=[XMPPMessage messageWithType:@"chat" to:[XMPPJID jidWithUser:[NSString stringWithFormat:@"%@",_chatPerson.userId] domain:@"hcios.com" resource:@"ios"]];
        [mes addChild:[DDXMLNode elementWithName:@"body" stringValue:msgJson]];
        
        //发送消息
        [[TdServerManager Instance] sendMessage:mes];
        
        
    }];
    [request setFailedBlock:^{
        [MMProgressHUD dismissWithError:@"发送失败" afterDelay:1.0f];
        //[self continueRegister:fileId];
    }];
    [request startAsynchronous];
    
}

- (IBAction)shareMore:(id)sender {
    
    [messageText setInputView:messageText.inputView?nil: _shareMoreView];
    
    [messageText reloadInputViews];
    [messageText becomeFirstResponder];
}

#pragma mark - Table view delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return msgRecords.count;
    //return 2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier=@"friendCell";
    TdTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[TdTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    TdMessage *msg=[msgRecords objectAtIndex:indexPath.row];
    [cell setMessageObject:msg];
    enum TdMessageCellStyle style=[msg.messageFrom isEqualToString:[[NSUserDefaults standardUserDefaults]stringForKey:kXMPPmyJID]]?TdMessageCellStyleMe:TdMessageCellStyleOther;
    
    style = TdMessageCellStyleOther;
    
    switch (style) {
        case TdMessageCellStyleMe:
//            [cell setHeadImage:FILE_BASE_URL([[NSUserDefaults standardUserDefaults]objectForKey:kMY_USER_Head]) tag:indexPath.row];
            [cell setHeadImageTest];
            
            break;
        case TdMessageCellStyleOther:
            //[cell setHeadImage:FILE_BASE_URL(_chatPerson.userHead) tag:indexPath.row];
            [cell setHeadImageTest];
            break;
        case TdMessageCellStyleMeWithImage:
        {
            [cell setHeadImage:FILE_BASE_URL([[NSUserDefaults standardUserDefaults]objectForKey:kMY_USER_Head]) tag:indexPath.row];
            
        }
            break;
        case TdMessageCellStyleOtherWithImage:{
            [cell setHeadImage:FILE_BASE_URL(_chatPerson.userHead) tag:indexPath.row];
        }
            break;
        default:
            break;
    }
    
    if ([msg.messageType intValue]==kWCMessageTypeImage) {
        style=style==TdMessageCellStyleMe?TdMessageCellStyleMeWithImage:TdMessageCellStyleOtherWithImage;
        [cell setChatImage:FILE_BASE_URL(msg.messageContent) tag:indexPath.row*2];
    }
    
    [cell setMsgStyle:style];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( [[msgRecords[indexPath.row] messageType]intValue]==kWCMessageTypeImage)
        return 55+100;
    else{
        
        NSString *orgin=[msgRecords[indexPath.row]messageContent];
        CGSize textSize=[orgin sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake((320-HEAD_SIZE-3*INSETS-40), TEXT_MAX_HEIGHT) lineBreakMode:NSLineBreakByWordWrapping];
        return 55+textSize.height;}
}

#pragma mark - Notification

-(void)newMsgCome:(NSNotification *)notifacation
{
    [self.tabBarController.tabBarItem setBadgeValue:@"1"];
    
    //[WCMessageObject save:notifacation.object];
    
    [self refresh];
    
}

#pragma mark - TdAdvancedChatFeature delegate

-(void)pickPhoto
{
    
    UIImagePickerController *imgPicker=[[UIImagePickerController alloc]init];
    [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [imgPicker setDelegate:self];
    [imgPicker setAllowsEditing:YES];
    [self.navigationController presentViewController:imgPicker animated:YES completion:^{
    }];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage  * chosedImage=[info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        //
        
        [self sendImage:chosedImage];
        
        
    }];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        //
    }];
}

@end