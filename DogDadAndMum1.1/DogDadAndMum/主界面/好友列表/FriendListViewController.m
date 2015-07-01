//
//  FriendListViewController.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/29.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "FriendListViewController.h"
#import "RecentTableViewCell.h"
#import "SearchResultView.h"
#import "AddFriendViewController.h"

#define SEARCH_BAR_HEIGHT 50

@interface FriendListViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (strong,nonatomic)UITableView *tableView;

/**
 *  tableView数据源
 */
@property (strong,nonatomic)NSMutableArray *dataSource;

/**
 *  右边的添加按钮
 */
@property (strong,nonatomic)UIBarButtonItem *rightButton;

/**
 *  搜索
 */
@property (strong,nonatomic)UISearchBar *searchBar;

/**
 *  点击搜索框，是否更改tableView的数据源
 */
@property (assign,nonatomic)BOOL temp;

/**
 *  显示搜索结果的view
 */
@property (strong,nonatomic)SearchResultView *searchResult;

/**
 *  取消按钮
 */
@property (strong,nonatomic)UIButton *cancelBtn;


@end

@implementation FriendListViewController




- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)initlizeAppearance{
    [super initlizeAppearance];
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = self.rightButton;
    [self.view addSubview:self.searchBar];
}

#pragma mark - 懒加载区域

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = ({
            
            UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0*[FlexibleFrame ratio], SEARCH_BAR_HEIGHT*[FlexibleFrame ratio], 320*[FlexibleFrame ratio], (568-49)*[FlexibleFrame ratio]) style:UITableViewStylePlain];
            tableView.backgroundColor = [UIColor whiteColor];
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView;
            
        });
    }
    return _tableView;
    
}


- (UIBarButtonItem *)rightButton{
    
    if (!_rightButton) {
        _rightButton = ({
            
            UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addAction:)];
            rightButton;
        });
    }
    return _rightButton;
    
}


- (UISearchBar *)searchBar{

    if (!_searchBar) {
        _searchBar = ({
        
            UISearchBar *search = [[UISearchBar alloc]initWithIPhone5Frame:CGRectMake(0, 64, 320, SEARCH_BAR_HEIGHT)];
            [search setPlaceholder:@"搜索"];
            search.delegate = self;
//            search.backgroundColor = [UIColor clearColor];
            search;
        
        });
    }
    return _searchBar;


}



- (SearchResultView *)searchResult{
    if (!_searchResult) {
        _searchResult = ({
            
            SearchResultView *searchResult = [[SearchResultView alloc]initWithIPhone5Frame:CGRectMake(0, 64+50, 320, 200)];
            
            searchResult;
        });
    }
    return _searchResult;


}

- (UIButton *)cancelBtn{

    if (!_cancelBtn) {
        _cancelBtn = ({
            UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            cancelBtn.frame = CGRectMake(270*[FlexibleFrame ratio], 64*[FlexibleFrame ratio], SEARCH_BAR_HEIGHT*[FlexibleFrame ratio], SEARCH_BAR_HEIGHT*[FlexibleFrame ratio]);
            cancelBtn.backgroundColor = [UIColor colorWithRed:0.702 green:0.698 blue:0.714 alpha:0.8];
            cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [cancelBtn addTarget:self action:@selector(canceAction:) forControlEvents:UIControlEventTouchUpInside];
            [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
            cancelBtn;
            
        });
    }
    return _cancelBtn;

}


- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}


#pragma mark - tableView的代理方法



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    RecentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[RecentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.picImageView.image = [UIImage imageNamed:@"52b546511ef75.jpg"];
//    cell.messageLabel.text = self.dataSource[indexPath.row];
    cell.messageLabel.text = @"王五";
    cell.timeLabel.hidden = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

#pragma mark - 选中cell执行的方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_searchBar isFirstResponder]) {
        [_searchBar resignFirstResponder];
    }

}


#pragma mark - searchBar代理方法

//开始搜索
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    
    NSLog(@"%@",searchText);
    //如果没搜索到调用
    [self.searchResult noFindFriend:searchText];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    [self.view addSubview:self.searchResult];
    self.searchResult.hidden = NO;
    self.cancelBtn.hidden = NO;
    self.searchBar.frame = CGRectMake(0*[FlexibleFrame ratio], 64*[FlexibleFrame ratio], 270*[FlexibleFrame ratio], SEARCH_BAR_HEIGHT*[FlexibleFrame ratio]);
    [self.view addSubview:self.cancelBtn];
    return YES;

}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if ([searchBar isFirstResponder]) {
        [searchBar resignFirstResponder];
    }
}






#pragma mark - 添加好友按钮事件

- (void)addAction:(UIButton *)sender{
    AddFriendViewController *addFriendVC = [[AddFriendViewController alloc]init];
    UINavigationController *addNav = [[UINavigationController alloc]initWithRootViewController:addFriendVC];
    [self.navigationController presentViewController:addNav animated:YES completion:nil];
    

}


#pragma mark - 退出搜索
- (void)canceAction:(UIButton *)sender{
    self.searchResult.hidden = YES;
    self.cancelBtn.hidden = YES;
    self.searchBar.frame = CGRectMake(0*[FlexibleFrame ratio], 64*[FlexibleFrame ratio], 320*[FlexibleFrame ratio], SEARCH_BAR_HEIGHT*[FlexibleFrame ratio]);
    if ([_searchBar isFirstResponder]) {
        [_searchBar resignFirstResponder];
    }
    
}







@end
