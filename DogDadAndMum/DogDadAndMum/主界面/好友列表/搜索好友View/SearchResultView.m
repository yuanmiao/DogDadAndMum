//
//  SearchResultView.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/30.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "SearchResultView.h"
#import "RecentTableViewCell.h"


@interface SearchResultView ()


@property (strong,nonatomic)UITableView *tableView;

/**
 *  搜索tableView的数据源
 */
@property (strong,nonatomic)NSMutableArray *searchResultdataSource;

/**
 *  是否搜索到结果
 */
@property (assign,nonatomic)BOOL searchResult;


/**
 *  点击搜索框，是否更改tableView的数据源
 */
@property (assign,nonatomic)BOOL temp;

@end

@implementation SearchResultView


- (instancetype)initWithIPhone5Frame:(CGRect)frame{

    if (self = [super initWithIPhone5Frame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        [self addSubview:self.tableView];
        _searchResultdataSource = [[NSMutableArray alloc]init];
    }
    return self;

}


#pragma mark - 懒加载区域

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = ({
            
            UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0*[FlexibleFrame ratio], 0*[FlexibleFrame ratio], 320*[FlexibleFrame ratio], (200)*[FlexibleFrame ratio]) style:UITableViewStylePlain];
            tableView.backgroundColor = [UIColor whiteColor];
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
    return _searchResultdataSource.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    RecentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[RecentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.picImageView.image = [UIImage imageNamed:@"52b546511ef75.jpg"];
    cell.messageLabel.text = _searchResultdataSource[indexPath.row];
    cell.timeLabel.hidden = YES;
    cell.rightminiView.hidden = NO;
    cell.userNameLabel.hidden = YES;
    //搜索无结果
    if (!_searchResult) {
        cell.picImageView.hidden = YES;
        cell.messageLabel.font = [UIFont systemFontOfSize:14];
        cell.messageLabel.frame = CGRectMake(20, 20, 250, 30);
        cell.rightminiView.frame =CGRectMake(280, 20, 30, 30);
    }
    return cell;
}



#pragma mark - 好友列表没有找到好友，进行好友搜索
- (void)noFindFriend:(NSString *)str{
    _searchResult = NO;
    [self.searchResultdataSource removeAllObjects];
    _temp = YES;
    if (str.length >2) {
        str = [str substringToIndex:2];
    }
    NSString *tempStr = [NSString stringWithFormat:@"\"%@\"...还不是好友，去搜索添加Ta",str];
    [_searchResultdataSource addObject:[NSString stringWithFormat:@"%@",tempStr]];
    if (str.length==0) {
        [self.searchResultdataSource removeAllObjects];
        [self.searchResultdataSource addObject:@"未找到"];
    }
    [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self endEditing:YES];
    
}




@end
