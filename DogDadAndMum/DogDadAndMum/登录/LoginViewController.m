//
//  LoginViewController.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/26.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "LoginViewController.h"
#import "LoadingView.h"
#import "RegViewController.h"

#define TEXTFIELD_WIDTH  240
#define TEXTFIELD_HEIGHT  43
#define TEXTFIELD_Y  200
#define TEXTFIELD_X  40
#define TEXTFIELD_MAGIN  20
#define LOGIN_PIC  3
#define LOGIN_PIC_HEIGHT  38
#define LOGIN_THREE_X  50
#define LOGIN_THREE_Y  450
#define LOGIN_THREE_MAGIN  30

#define TAG  100

@interface LoginViewController ()<UITextFieldDelegate>

/**
 *  顶部狗狗视图
 */
@property (strong,nonatomic)UIImageView *topDogImageView;


/**
 *  用户名的背景图
 */
@property (strong,nonatomic)UIImageView *userImageView;

/**
 *  输入密码的背景图
 */
@property (strong,nonatomic)UIImageView *psdImageView;

/**
 *  用户名输入框
 */
@property (strong,nonatomic)UITextField *userField;

/**
 *  密码输入框
 */
@property (strong,nonatomic)UITextField *psdField;

/**
 *  登录
 */
@property (strong,nonatomic)UIButton *submitBtn;

/**
 *  新用户注册
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

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 懒加载界面的控件

- (UIImageView *)topDogImageView{

    if (!_topDogImageView) {
        
        _topDogImageView = [[UIImageView alloc]initWithIPhone5Frame:CGRectMake(83, 60, 200, 224)];
        _topDogImageView.image = [UIImage imageNamed:@"1"];
    }
    return _topDogImageView;

}


- (UIImageView *)userImageView{

    if (!_userImageView) {
        _userImageView = ({
            UIImageView *userImageView = [[UIImageView alloc]initWithIPhone5Frame:CGRectMake(TEXTFIELD_X, TEXTFIELD_Y, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT)];
            userImageView.image        = [UIImage imageNamed:@"login_textFieldBg@2x"];
            UIImageView *login_person  = [[UIImageView alloc]initWithIPhone5Frame:CGRectMake(LOGIN_PIC, LOGIN_PIC, LOGIN_PIC_HEIGHT, LOGIN_PIC_HEIGHT)];
            login_person.image         = [UIImage imageNamed:@"login_person"];
            [userImageView addSubview:login_person];
            userImageView;
        });
    }
    return _userImageView;
}

#pragma mark - 懒加载输入密码的背景
- (UIImageView *)psdImageView{
    
    if (!_psdImageView) {
        _psdImageView = ({
            UIImageView *psdImageView = [[UIImageView alloc]initWithIPhone5Frame:CGRectMake(TEXTFIELD_X, TEXTFIELD_Y+TEXTFIELD_MAGIN+TEXTFIELD_HEIGHT, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT)];
            psdImageView.image        = [UIImage imageNamed:@"login_textFieldBg@2x"];
            UIImageView *login_password  = [[UIImageView alloc]initWithIPhone5Frame:CGRectMake(LOGIN_PIC, LOGIN_PIC, LOGIN_PIC_HEIGHT, LOGIN_PIC_HEIGHT)];
            login_password.image         = [UIImage imageNamed:@"login_password"];
            [psdImageView addSubview:login_password];
            psdImageView;
        });
    }
    return _psdImageView;
}

#pragma mark - 输入用户名
- (UITextField *)userField{
    if (!_userField) {
        _userField = ({
            UITextField *userField = [[UITextField alloc]initWithIPhone5Frame:CGRectMake(TEXTFIELD_X  + LOGIN_PIC*2 + LOGIN_PIC_HEIGHT, TEXTFIELD_Y, TEXTFIELD_WIDTH - 80, TEXTFIELD_HEIGHT)];
            userField.placeholder = @"请输入用户名";
            userField.font = Font;
            userField.tag = TAG;
            userField.delegate = self;
            userField.textColor = [UIColor colorWithWhite:0.200 alpha:1.000];
            userField.clearButtonMode = UITextFieldViewModeWhileEditing;
            userField;
        
        });
    }
    return _userField;

}

#pragma mark - 输入密码
- (UITextField *)psdField{
    if (!_psdField) {
        _psdField = ({
            UITextField *psdField = [[UITextField alloc]initWithIPhone5Frame:CGRectMake(TEXTFIELD_X  + LOGIN_PIC*2 + LOGIN_PIC_HEIGHT, TEXTFIELD_Y+TEXTFIELD_MAGIN+TEXTFIELD_HEIGHT, TEXTFIELD_WIDTH - 80, TEXTFIELD_HEIGHT)];
            psdField.placeholder = @"请输入密码";
            psdField.font = Font;
            psdField.tag = TAG +1;
            psdField.delegate = self;
            psdField.textColor = [UIColor colorWithWhite:0.200 alpha:1.000];
            psdField.clearButtonMode = UITextFieldViewModeWhileEditing;
            psdField.secureTextEntry = YES;
            psdField;
            
        });
    }
    return _psdField;
    
}

#pragma mark - 登录按钮
- (UIButton *)submitBtn{
    _submitBtn = ({
    
        UIButton *submit = [UIButton buttonWithType:UIButtonTypeSystem];
        [submit setTitle:@"登录" forState:UIControlStateNormal];
        submit.titleLabel.font = Font;
        [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        submit.backgroundColor = [UIColor colorWithRed:0.839 green:0.529 blue:0.298 alpha:1.000];
        [submit addTarget:self action:@selector(loginPressAction:) forControlEvents:UIControlEventTouchUpInside];
        submit.layer.cornerRadius = 15;
        submit.frame = CGRectMake(TEXTFIELD_X *[FlexibleFrame ratio], 370*[FlexibleFrame ratio], TEXTFIELD_WIDTH*[FlexibleFrame ratio], 45*[FlexibleFrame ratio]);
        submit;
    
    });
    return _submitBtn;

}

#pragma mark - 新用户注册按钮
- (UIButton *)regBtn{
    _regBtn = ({
        
        UIButton *regBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [regBtn setTitle:@"新用户注册" forState:UIControlStateNormal];
        regBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [regBtn setTitleColor:[UIColor colorWithWhite:0.686 alpha:1.000] forState:UIControlStateNormal];
        [regBtn addTarget:self action:@selector(regPressAction:) forControlEvents:UIControlEventTouchUpInside];
        regBtn.frame = CGRectMake(100 *[FlexibleFrame ratio], 320*[FlexibleFrame ratio], TEXTFIELD_WIDTH*[FlexibleFrame ratio], 33*[FlexibleFrame ratio]);
        regBtn;
    });
    return _regBtn;

}


- (UIButton *)weixinBtn{
    if (!_weixinBtn) {
        _weixinBtn = ({
            UIButton *weixinBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            weixinBtn.frame = CGRectMake((LOGIN_THREE_X)*[FlexibleFrame ratio], LOGIN_THREE_Y*[FlexibleFrame ratio], TEXTFIELD_HEIGHT*[FlexibleFrame ratio], TEXTFIELD_HEIGHT*[FlexibleFrame ratio]);
            [weixinBtn setBackgroundImage:[UIImage imageNamed:@"login_wx"] forState:UIControlStateNormal];
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
            qqBtn.frame = CGRectMake((LOGIN_THREE_X+LOGIN_THREE_MAGIN +TEXTFIELD_HEIGHT)*[FlexibleFrame ratio], LOGIN_THREE_Y*[FlexibleFrame ratio], TEXTFIELD_HEIGHT*[FlexibleFrame ratio], TEXTFIELD_HEIGHT*[FlexibleFrame ratio]);
            [qqBtn setBackgroundImage:[UIImage imageNamed:@"login_qq"] forState:UIControlStateNormal];
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
            weiboBtn.frame = CGRectMake((165 + LOGIN_THREE_MAGIN) *[FlexibleFrame ratio], LOGIN_THREE_Y*[FlexibleFrame ratio], TEXTFIELD_HEIGHT*[FlexibleFrame ratio], TEXTFIELD_HEIGHT*[FlexibleFrame ratio]);
            [weiboBtn setBackgroundImage:[UIImage imageNamed:@"login_weibo"] forState:UIControlStateNormal];
            [weiboBtn addTarget:self action:@selector(weiboPressAction:) forControlEvents:UIControlEventTouchUpInside];
            weiboBtn;
        });
    }
    return _weiboBtn;
}






- (void)initlizeAppearance{
    self.view.backgroundColor = [UIColor colorWithWhite:0.937 alpha:1.000];
    [self.view addSubview:self.topDogImageView];
    [self.view addSubview:self.userImageView];
    [self.view addSubview:self.psdImageView];
    [self.view addSubview:self.userField];
    [self.view addSubview:self.psdField];
    [self.view addSubview:self.submitBtn];
    [self.view addSubview:self.regBtn];
    [self.view addSubview:self.weixinBtn];
    [self.view addSubview:self.qqBtn];
    [self.view addSubview:self.weiboBtn];
    
    
}




#pragma mark - 点击登录按钮的事件


- (void)loginPressAction:(UIButton *)sender{
    NSLog(@"登录");
    //登录动画
    LoadingView *load = [[LoadingView alloc]initWithIPhone5Frame:CGRectMake(0, 0, 320, 568)];
    [self.view addSubview:load];
    [load startLoading];
}

#pragma mark - 点击注册按钮的事件


- (void)regPressAction:(UIButton *)sender{
    
    NSLog(@"新用户注册");
    RegViewController *regVC = [[RegViewController alloc]init];
    [self presentViewController:regVC animated:YES completion:nil];
    
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
