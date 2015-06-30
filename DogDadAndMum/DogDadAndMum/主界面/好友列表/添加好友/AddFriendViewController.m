//
//  AddFriendViewController.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/30.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "AddFriendViewController.h"
#import "RecentTableViewCell.h"
#import "AccountViewController.h"

#define CELL_HEIGHT 80

@interface AddFriendViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic)UITableView *tableView;

///**
// *  左边的返回按钮
// */
//@property (strong,nonatomic)UIBarButtonItem *leftButton;

/**
 *  存储添加好友的cell的pic小图
 */
@property (strong,nonatomic)NSArray *picDataSource;

/**
 *  存储添加好友的cell的title
 */
@property (strong,nonatomic)NSArray *titleDataSource;

@end

@implementation AddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)initlizeDataSource{

    [super initlizeDataSource];
    _picDataSource = @[@"iconfont-sousuo",@"iconfont-fujinzhoubianxinxi",@"iconfont-saoyisao"];
    _titleDataSource = @[@"按照账号搜索",@"附近的狗狗",@"扫一扫"];
}

- (void)initlizeAppearance{
    [super initlizeAppearance];
    
    self.navigationItem.leftBarButtonItem = self.leftButton;
    [self.view addSubview:self.tableView];
    self.title = @"添加好友";
}


#pragma mark - 懒加载区域

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = ({
            
            UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0*[FlexibleFrame ratio], 0*[FlexibleFrame ratio], 320*[FlexibleFrame ratio], (568-49)*[FlexibleFrame ratio]) style:UITableViewStylePlain];
            tableView.backgroundColor = [UIColor whiteColor];
            tableView.scrollEnabled = NO;
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView;
            
        });
    }
    return _tableView;
    
}



#pragma mark - tableView的代理方法



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _picDataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    RecentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[RecentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.picImageView.image = [UIImage imageNamed:_picDataSource[indexPath.row]];
    cell.picImageView.frame = CGRectMake(10*[FlexibleFrame ratio], 20*[FlexibleFrame ratio], 30*[FlexibleFrame ratio], 30*[FlexibleFrame ratio]);
    cell.rightminiView.frame =CGRectMake(280*[FlexibleFrame ratio], 20*[FlexibleFrame ratio], 30*[FlexibleFrame ratio], 30*[FlexibleFrame ratio]);
    cell.messageLabel.frame =CGRectMake(60*[FlexibleFrame ratio], 25*[FlexibleFrame ratio], 172*[FlexibleFrame ratio], 21*[FlexibleFrame ratio]);
    cell.picImageView.layer.cornerRadius = 0;
    cell.messageLabel.textColor = [UIColor blackColor];
    cell.messageLabel.text = _titleDataSource[indexPath.row];
    cell.userNameLabel.hidden = YES;
    cell.timeLabel.hidden = YES;
    cell.rightminiView.hidden = NO;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return CELL_HEIGHT;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == 0) {
        AccountViewController *accountVC = [[AccountViewController alloc]init];
        UINavigationController *accountNAV = [[UINavigationController alloc]initWithRootViewController:accountVC];
        [self.navigationController presentViewController:accountNAV animated:YES completion:nil];
    }


}









#pragma mark - 返回好友列表

- (void)returnAction:(UIBarButtonItem *)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}





@end
