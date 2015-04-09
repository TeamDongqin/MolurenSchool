//
//  TdMsgListViewController.m
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/9.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TdMsgListViewController.h"
#import "TdMsgListCell.h"

@implementation TdMsgListViewController

#pragma mark - View life cycle

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"微信"];
    [self refresh];
    
    for (int i = 0; i < 10; i ++) {
        [self FillData];
    }
    
    _messageTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Device_Width, Device_Height) style:UITableViewStyleGrouped];
    _messageTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //[_messageTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _messageTable.scrollEnabled = YES;
    _messageTable.dataSource = self;
    _messageTable.delegate = self;
    
    [self.view addSubview:_messageTable];
    
//    WCXMPPManager *manager= [WCXMPPManager sharedInstance];
//    [manager goOnline];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(newMsgCome:) name:kXMPPNewMsgNotifaction object:nil];
}

#pragma mark - Ui operation

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _msgArr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier=@"messageCell";
    TdMsgListCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[TdMsgListCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    TdMessageUnion *unionObject=[_msgArr objectAtIndex:indexPath.row];
    [cell.userHead setTag:indexPath.row];
    [cell setUnionObject:unionObject];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    WCSendMessageController *sendView=[[[WCSendMessageController alloc]init]autorelease];
//    
//    WCMessageUserUnionObject *unionObj=[_msgArr objectAtIndex:indexPath.row];
//    
//    [sendView setChatPerson:unionObj.user];
//    [sendView setHidesBottomBarWhenPushed:YES];
//    [self.navigationController pushViewController:sendView animated:YES];
}

-(void)refresh
{
    _msgArr=[TdMessage fetchRecentChatByPage:1];
    [_messageTable reloadData];
}

#pragma mark - Notification

#pragma mark - Data

-(void)FillData{
    
    TdMessage *message=[[TdMessage alloc]init];
    [message setMessageId:0];
    [message setMessageContent:@"Test"];
    [message setMessageDate:[[NSData alloc] init]];
    [message setMessageFrom:@"TestFrom"];
    [message setMessageTo:@"TestTo"];
    [message setMessageType:0];
    
    TdStudent *user=[[TdStudent alloc]init];
    [user setUserId:@"1"];
    [user setUserNickname:@"TestNickName"];
    [user setUserHead:@"TestUserHead"];
    [user setUserDescription:@"TestDescription"];
    [user setFriendFlag:[NSNumber numberWithInt:1] ];
    
    TdMessageUnion *unionObject=[TdMessageUnion unionWithMessage:message andUser:user ];
    
    [ _msgArr addObject:unionObject];
}

@end