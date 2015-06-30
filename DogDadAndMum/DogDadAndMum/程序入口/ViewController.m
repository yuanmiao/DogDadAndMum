//
//  ViewController.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/26.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

/**
 *  进入app,主界面的背景图
 */
@property (strong,nonatomic)UIImageView *bgImageView;
/**
 *  登录按钮
 */
@property (strong,nonatomic)UIButton *loginBtn;
/**
 * 注册按钮
 */
@property (strong,nonatomic)UIButton *regBtn;

/**
 *  使用微信登录按钮
 */
@property (strong,nonatomic)UIButton *weixinBtn;
/**
 *  使用QQ登录按钮
 */
@property (strong,nonatomic)UIButton *qqBtn;

/**
 *  使用微博登录按钮
 */
@property (strong,nonatomic)UIButton *weiboBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - 懒加载登录按钮、背景图片控件、注册按钮

- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = ({
            UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
            bgImageView.image = [UIImage imageNamed:@"登录前副本"];
            bgImageView;
        });
    }
    return _bgImageView;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = ({
            UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            loginBtn.frame = CGRectMake(76*[FlexibleFrame ratio], 298*[FlexibleFrame ratio], 187*[FlexibleFrame ratio], 46*[FlexibleFrame ratio]);
            loginBtn.backgroundColor = [UIColor clearColor];
            [loginBtn addTarget:self action:@selector(loginPressAction:) forControlEvents:UIControlEventTouchUpInside];
            loginBtn;
        });
    }
    return _loginBtn;
}

- (UIButton *)regBtn{
    if (!_regBtn) {
        _regBtn = ({
            UIButton *regBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            regBtn.frame = CGRectMake(76*[FlexibleFrame ratio], 362*[FlexibleFrame ratio], 187*[FlexibleFrame ratio], 46*[FlexibleFrame ratio]);
            regBtn.backgroundColor = [UIColor clearColor];
            [regBtn addTarget:self action:@selector(regPressAction:) forControlEvents:UIControlEventTouchUpInside];
            regBtn;
        });
    }
    return _regBtn;
}

- (UIButton *)weixinBtn{
    if (!_weixinBtn) {
        _weixinBtn = ({
            UIButton *weixinBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            weixinBtn.frame = CGRectMake(76*[FlexibleFrame ratio], 500*[FlexibleFrame ratio], 32*[FlexibleFrame ratio], 26*[FlexibleFrame ratio]);
            weixinBtn.backgroundColor = [UIColor clearColor];
            [weixinBtn addTarget:self action:@selector(weixinPressAction:) forControlEvents:UIControlEventTouchUpInside];
            weixinBtn;
        });
    }
    return _weixinBtn;
}

- (UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = ({
            UIButton *qqBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            qqBtn.frame = CGRectMake(134*[FlexibleFrame ratio], 500*[FlexibleFrame ratio], 32*[FlexibleFrame ratio], 26*[FlexibleFrame ratio]);
            qqBtn.backgroundColor = [UIColor clearColor];
            [qqBtn addTarget:self action:@selector(qqPressAction:) forControlEvents:UIControlEventTouchUpInside];
            qqBtn;
        });
    }
    return _qqBtn;
}
- (UIButton *)weiboBtn{
    if (!_weiboBtn) {
        _weiboBtn = ({
            UIButton *weiboBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            weiboBtn.frame = CGRectMake(186*[FlexibleFrame ratio], 500*[FlexibleFrame ratio], 32*[FlexibleFrame ratio], 26*[FlexibleFrame ratio]);
            weiboBtn.backgroundColor = [UIColor clearColor];
            [weiboBtn addTarget:self action:@selector(weiboPressAction:) forControlEvents:UIControlEventTouchUpInside];
            weiboBtn;
        });
    }
    return _weiboBtn;
}




- (void)initlizeAppearance{
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.regBtn];
    [self.view addSubview:self.weixinBtn];
    [self.view addSubview:self.qqBtn];
    [self.view addSubview:self.weiboBtn];
}


#pragma mark - 点击登录按钮的事件


- (void)loginPressAction:(UIButton *)sender{
    NSLog(@"登录");
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

#pragma mark - 点击注册按钮的事件


- (void)regPressAction:(UIButton *)sender{
    
    NSLog(@"注册");
    
}


#pragma mark - 点击微信按钮的事件


- (void)weixinPressAction:(UIButton *)sender{
    
    NSLog(@"微信登录");
    
}


#pragma mark - 点击qq按钮的事件


- (void)qqPressAction:(UIButton *)sender{
    
    NSLog(@"qq登录");
    
}



#pragma mark - 点击微博按钮的事件


- (void)weiboPressAction:(UIButton *)sender{
    
    NSLog(@"微博登录");
    
}




@end
