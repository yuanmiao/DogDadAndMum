//
//  RecentViewController.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/29.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "RecentViewController.h"
#import "RecentTableViewCell.h"
#import "MoreView.h"

@interface RecentViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic)UITableView *tableView;
/**
 *  右边的更多按钮
 */
@property (strong,nonatomic)UIBarButtonItem *rightButton;


/**
 *  更多的视图
 */
@property (strong,nonatomic)MoreView *more;

@end

@implementation RecentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - 懒加载区域

- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = ({
        
            UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0*[FlexibleFrame ratio], 0*[FlexibleFrame ratio], 320*[FlexibleFrame ratio], (568-49)*[FlexibleFrame ratio]) style:UITableViewStylePlain];
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
        
            UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(moreAction:)];
            rightButton;
        });
    }
    return _rightButton;


}

- (MoreView *)more{
    
    if (!_more) {
        _more = ({
            MoreView *more = [[MoreView alloc]initWithIPhone5Frame:CGRectMake(0, 0, 320, 568)];
            more.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
            more;
        });
    }
    return _more;
}






- (void)initlizeDataSource{
    [super initlizeDataSource];

}



- (void)initlizeAppearance{
    [super initlizeAppearance];
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = self.rightButton;
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
    cell.picImageView.image = [UIImage imageNamed:@"52b546511ef75.jpg"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;

}


-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        //        获取选中删除行索引值
        NSInteger row = [indexPath row];
        //        通过获取的索引值删除数组中的值
//        [self.listData removeObjectAtIndex:row];
        //        删除单元格的某一行时，在用动画效果实现删除过程
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}




- (void)moreAction:(UIBarButtonItem *)sender{
    if (!self.more.rightBtnSelect) {
        [self.view addSubview:_more];
        _more.rightBtnSelect = YES;
    }
}





@end
