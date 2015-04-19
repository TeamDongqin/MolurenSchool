//
//  TdFindFriendViewController.m
//  MolurenSchool
//
//  Created by zheng lingshan on 15/4/12.
//  Copyright (c) 2015年 TeamDQ. All rights reserved.
//

#import "TdFindFriendViewController.h"
#import "TdFindFriendViewCellController.h"
#import "ASIFormDataRequest.h"
#import "MMProgressHUD.h"
#import "SBJsonParser.h"
#import "TdUserModel.h"

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
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:API_BASE_URL(@"findFriend.do")];
    
    [request setPostValue:[[NSUserDefaults standardUserDefaults]objectForKey:kMY_API_KEY ] forKey:@"apiKey"];
    [request setPostValue:[NSNumber numberWithInt:_pageIndex] forKey:@"pageIndex"];
    [request setPostValue:[NSNumber numberWithInt:10] forKey:@"pageSize"];
    [request setPostValue:searchKey forKey:@"nickName"];
    [MMProgressHUD showWithTitle:@"查找好友" status:@"请求中..." ];
    [request setCompletionBlock:^{
        NSLog(@"response:%@",request.responseString);
        SBJsonParser *paser=[[SBJsonParser alloc]init];
        NSDictionary *rootDic=[paser objectWithString:request.responseString];
        int resultCode=[[rootDic objectForKey:@"status"]intValue];
        if (resultCode==1) {
            [MMProgressHUD dismissWithSuccess:[rootDic objectForKey:@"msg"] title:@"查找好友成功" afterDelay:0.75f];
            //保存账号信息
            NSArray *userArr=[rootDic objectForKey:@"userList"];
            
            for (NSDictionary *dic in userArr) {
                [_friendArray addObject:dic];
                TdUserModel *user=[TdUserModel userFromDictionary:dic];
                if (![TdUserModel haveSaveUserById:user.userId]) {
                    [TdUserModel saveNewUser:user];
                }
            }
            [_friendTable reloadData];
            [self.searchDisplayController.searchResultsTableView reloadData];
            
            
            
        }else
        {
            [MMProgressHUD dismissWithError:[rootDic objectForKey:@"msg"] title:@"查找好友失败" afterDelay:0.75f];
        }
        
    }];
    
    [request setFailedBlock:^{
        [MMProgressHUD dismissWithError:@"链接服务器失败！" title:@"查找好友失败" afterDelay:0.75f];
    }];
    
    [request startAsynchronous];
}

-(void)requestError:(ASIFormDataRequest *)request
{
    NSLog(@"请求失败");
}


#pragma TableView协议    start----------TableView协议---------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _friendArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier=@"friendCell";
    
    
    TdFindFriendViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    [cell.nickName setText:[_friendArray[indexPath.row]objectForKey:@"nickName"]];
    [cell.description setText:[_friendArray[indexPath.row]objectForKey:@"description"]];
    
    //网络头像
    [cell.userHead setTag:indexPath.row];
    [cell.userHead setWebImage:FILE_BASE_URL([_friendArray[indexPath.row]objectForKey:@"userHead"]) placeHolder:[UIImage imageNamed:@"mb.png"] downloadFlag:indexPath.row];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y<-50&&scrollView.contentOffset.y>-100)
    {
        [refreshView setHidden:NO];
        [refreshView setTransform:CGAffineTransformMakeRotation(scrollView.contentOffset.y/10)];
    }else
    {
        //[refreshView setHidden:YES];
    }

}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    
    if (scrollView.contentOffset.y<-100) {
        
        [UIView animateWithDuration:2.0 animations:^{
            [refreshView.layer setTransform:CATransform3DMakeRotation(-100*M_PI, 0, 0, 1)];
        } completion:^(BOOL finished) {
            [refreshView setHidden:YES];
        }];
        _pageIndex=1;
        [_friendArray removeAllObjects];
        [_friendTable reloadData];
        [self.searchDisplayController.searchResultsTableView reloadData];
        [self findFriends];
    }
    if (scrollView.contentOffset.y>(scrollView.contentSize.height-scrollView.frame.size.height+100)) {
        _pageIndex++;
        [self findFriends];
        [self.searchDisplayController.searchResultsTableView reloadData];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    WCUserProfileViewController *profileView=[[[WCUserProfileViewController alloc]init]autorelease];
//    WCUserObject *user=[[[WCUserObject alloc]init]autorelease];
//    NSDictionary *dic=_friendsArray[indexPath.row];
//    [user setUserId:[dic objectForKey:@"userId"]];
//    [user setUserNickname:[dic objectForKey:@"nickName"]];
//    [user setUserDescription:[dic objectForKey:@"description"]];
//    [user setUserHead:[dic objectForKey:@"userHead"]];
//    
//    
//    
//    [profileView setThisUser:user];
//    
//    [profileView setHidesBottomBarWhenPushed:YES];
//    [self.navigationController pushViewController:profileView animated:YES];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma TableView协议  end

-(void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
}


-(void)refrenshDataWithLastSEL{
    
}

-(IBAction)searchUser:(id)sender{
    [findView setCenter:CGPointMake(160, self.view.frame.size.height/2)];
    [web loadRequest:[NSURLRequest requestWithURL:API_BASE_URL(@"user/addFriend.html")]];
    [self.view addSubview:findView];
}

-(IBAction)closeFind:(id)sender{
    [findView removeFromSuperview];
}

-(IBAction)webBack:(id)sender{
    [web goBack];
}

#pragma mark   搜索

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString;
{
    
    return NO;
}




- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    searchKey=@"";
    _pageIndex=1;
    [_friendArray removeAllObjects];
    [self findFriends];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    searchKey=searchBar.text;
    _pageIndex=1;
    [_friendArray removeAllObjects];
    [self findFriends];
}

@end
