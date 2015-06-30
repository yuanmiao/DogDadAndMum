//
//  AccountViewController.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/30.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()

/**
 *  输入账号
 */
@property (strong,nonatomic)UITextField *inputNumberField;

/**
 *  搜索查找好友
 */
@property (strong,nonatomic)UIButton *searchBtn;


@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initlizeAppearance{

    [super initlizeAppearance];
    self.view.backgroundColor = [UIColor colorWithWhite:0.957 alpha:1.000];
    self.title = @"按照账号搜索";
    self.navigationItem.leftBarButtonItem = self.leftButton;
    UILabel *label = [[UILabel alloc]initWithIPhone5Frame:CGRectMake(0, 64, 320, 43)];
    label.backgroundColor = [UIColor colorWithWhite:0.957 alpha:0.8];
    label.text = @"    请输入完整的账号";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor colorWithWhite:0.671 alpha:1.000];
    label.layer.borderWidth = 1;
    label.layer.borderColor = [UIColor colorWithWhite:0.655 alpha:0.5].CGColor;
    [self.view addSubview:label];
    UIView *bgView = [[UIView alloc]initWithIPhone5Frame:CGRectMake(0, 64+43, 320, 53)];
    bgView.backgroundColor = [UIColor whiteColor];
    UIView *line = [[UIView alloc]initWithIPhone5Frame:CGRectMake(0, 52, 320, 1)];
    line.backgroundColor = [UIColor colorWithWhite:0.655 alpha:0.5];
    [bgView addSubview:line];
    [self.view addSubview:bgView];
    
    [bgView addSubview:self.inputNumberField];
    [self.view addSubview:self.searchBtn];

    
}

- (UITextField *)inputNumberField{

    if (!_inputNumberField) {
        _inputNumberField = ({
            UITextField *input = [[UITextField alloc]initWithIPhone5Frame:CGRectMake(20, 0, 320, 53)];
            input;
        
        });
    }
    return _inputNumberField;

}


- (UIButton *)searchBtn{

    if (!_searchBtn) {
        _searchBtn = ({
        
            UIButton *submit = [UIButton buttonWithType:UIButtonTypeSystem];
            [submit setTitle:@"搜索" forState:UIControlStateNormal];
            submit.titleLabel.font = Font;
            [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            submit.backgroundColor = [UIColor colorWithRed:0.839 green:0.529 blue:0.298 alpha:1.000];
            [submit addTarget:self action:@selector(searchPressAction:) forControlEvents:UIControlEventTouchUpInside];
            submit.layer.cornerRadius = 15;
            submit.frame = CGRectMake(50 *[FlexibleFrame ratio], 200*[FlexibleFrame ratio], 200*[FlexibleFrame ratio], 45*[FlexibleFrame ratio]);
            submit;
        });
    }
    return _searchBtn;

}


#pragma mark - 搜索添加好友

- (void)searchPressAction:(UIButton *)sender{

    


}








- (void)returnAction:(UIBarButtonItem *)sender{
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}


@end
