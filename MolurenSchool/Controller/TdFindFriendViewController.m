//
//  TdFindFriendViewController.m
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/12.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TdFindFriendViewController.h"
#import "TdFindFriendViewCellController.h"

@interface TdFindFriendViewController()

@end

@implementation TdFindFriendViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self){
        //Custom initialization
    }
    
    return self;
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    _friendArray = [[NSMutableArray alloc] init];
    
    self.navigationItem.title = @"最新注册用户";
    _pageIndex = 1;
    searchKey = @"";
    
    [self findFriends];
    
    [_friendTable registerNib:[UINib nibWithNibName:@"TdFindFriendViewCell" bundle:nil] forCellReuseIdentifier:@"friendCell"];
    [self.searchDisplayController.searchResultsTableView registerNib:[UINib nibWithNibName:@"TdFindFriendViewCell" bundle:nil] forCellReuseIdentifier:@"friendCell"];
    
}

-(void)findFriends{
    /* 搜索好友接口 */
//    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:API_BASE_URL(@"findFriend.do")];
//    
//    [request setPostValue:[[NSUserDefaults standardUserDefaults]objectForKey:kMY_API_KEY ] forKey:@"apiKey"];
//    [request setPostValue:[NSNumber numberWithInt:_pageIndex] forKey:@"pageIndex"];
//    [request setPostValue:[NSNumber numberWithInt:10] forKey:@"pageSize"];
//    [request setPostValue:searchKey forKey:@"nickName"];
//    [MMProgressHUD showWithTitle:@"查找好友" status:@"请求中..." ];
//    [request setCompletionBlock:^{
//        NSLog(@"response:%@",request.responseString);
//        SBJsonParser *paser=[[[SBJsonParser alloc]init]autorelease];
//        NSDictionary *rootDic=[paser objectWithString:request.responseString];
//        int resultCode=[[rootDic objectForKey:@"status"]intValue];
//        if (resultCode==1) {
//            [MMProgressHUD dismissWithSuccess:[rootDic objectForKey:@"msg"] title:@"查找好友成功" afterDelay:0.75f];
//            //保存账号信息
//            NSArray *userArr=[rootDic objectForKey:@"userList"];
//            
//            for (NSDictionary *dic in userArr) {
//                [_friendsArray addObject:dic];
//                WCUserObject *user=[WCUserObject userFromDictionary:dic];
//                if (![WCUserObject haveSaveUserById:user.userId]) {
//                    [WCUserObject saveNewUser:user];
//                }
//            }
//            [_friendTable reloadData];
//            [self.searchDisplayController.searchResultsTableView reloadData];
//            
//            
//            
//        }else
//        {
//            [MMProgressHUD dismissWithError:[rootDic objectForKey:@"msg"] title:@"查找好友失败" afterDelay:0.75f];
//        }
//        
//    }];
//    
//    [request setFailedBlock:^{
//        [MMProgressHUD dismissWithError:@"链接服务器失败！" title:@"查找好友失败" afterDelay:0.75f];
//    }];
//    
//    [request startAsynchronous];
}

#pragma TableView协议    ----------TableView协议---------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _friendArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}

#pragma TableView协议

-(void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
}


-(void)refrenshDataWithLastSEL{
    
}

-(IBAction)searchUser:(id)sender{

}

-(IBAction)closeFind:(id)sender{
    
}

-(IBAction)webBack:(id)sender{
    
}

@end
