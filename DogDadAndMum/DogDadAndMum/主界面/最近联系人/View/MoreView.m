//
//  MoreView.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/29.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "MoreView.h"
#import "MoreViewCell.h"
#import "AccountViewController.h"
#import "AppDelegate.h"

@interface MoreView ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic)NSArray *cellPicDataSource;

@property (strong,nonatomic)NSArray *cellLabelDataSource;


@property (strong,nonatomic)UITableView *tableView;

@end


@implementation MoreView


- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithIPhone5Frame:CGRectMake(150, 64, 160, 160)];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.layer.cornerRadius = 5;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
    
}


- (NSArray *)cellPicDataSource{
    
    if (!_cellPicDataSource) {
        _cellPicDataSource = @[@"iconfont-tianjiahaoyouadd",@"iconfont-saoyisao"];
    }
    return _cellPicDataSource;
}


- (NSArray *)cellLabelDataSource{
    
    if (!_cellLabelDataSource) {
        _cellLabelDataSource = @[@"添加朋友",@"扫一扫"];
    }
    return _cellLabelDataSource;
}


- (instancetype)initWithIPhone5Frame:(CGRect)frame{
    if (self = [super initWithIPhone5Frame:frame]) {
        
        [self addSubview:self.tableView];
    }
    
    return self;
}




#pragma mark - tableView的代理方法



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellLabelDataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    MoreViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MoreViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:self.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0.200 green:0.224 blue:0.239 alpha:1.000];
    cell.picImageView.image = [UIImage imageNamed:self.cellPicDataSource[indexPath.row]];
    cell.cellTitleLabel.text = self.cellLabelDataSource[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.rightBtnSelect = NO;
    [self removeFromSuperview];


}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    if (indexPath.row == 0) {
        AccountViewController *accountVC =[[AccountViewController alloc]init];
        UINavigationController *addNav = [[UINavigationController alloc]initWithRootViewController:accountVC];
        [app.window.rootViewController presentViewController:addNav animated:YES completion:nil];
    }else{
        NSLog(@"扫一扫");
    
    }

}



@end
