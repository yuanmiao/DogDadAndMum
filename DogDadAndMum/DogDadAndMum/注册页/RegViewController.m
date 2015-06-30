//
//  RegViewController.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/26.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "RegViewController.h"
#import "AMBlurView.h"
#define BLURVIEW_WIDTH 250

@interface RegViewController ()<UITextFieldDelegate>

/**
 *  毛玻璃效果View
 */
@property (strong,nonatomic)UIVisualEffectView *visualEfView;

/**
 *  输入文本框缺省的值
 */
@property (strong,nonatomic)NSArray *textPlaceFieldArray;

/**
 *  存储本页所有文本框的控件
 */
@property (strong,nonatomic)NSMutableArray *textFieldArray;

/**
 *  顶部的背景图
 */
@property (strong,nonatomic)UIView *topBgView;


/**
 *  除顶部以外的背景图
 */

@property (strong,nonatomic)UIView *buttomBgView;

/**
 *  返回按钮
 */
@property (strong,nonatomic)UIButton *returnBtn;

/**
 *  title
 */
@property (strong,nonatomic)UIButton *titleBtn;


/**
 *  增加头像按钮
 */
@property (strong,nonatomic)UIButton *addPIcBtn;

/**
 *  textfield背景
 */
@property (strong,nonatomic)UIImageView *textFieldImaeView;


/**
 *  用户名
 */
@property (strong,nonatomic)UITextField *usernameField;

/**
 *  获取验证码按钮
 */
@property (strong,nonatomic)UIButton *getCodeBtn;


/**
 *  注册按钮
 */
@property (strong,nonatomic)UIButton *regBtn;



/**
 *  已有账号登录按钮
 */
@property (strong,nonatomic)UIButton *submitBtn;



@end

@implementation RegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (UIVisualEffectView *)visualEfView{
    if (!_visualEfView) {
        _visualEfView = ({
            UIVisualEffectView *visualEfView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
            visualEfView.frame = CGRectMake(35*[FlexibleFrame ratio], 44*[FlexibleFrame ratio], 250*[FlexibleFrame ratio], 480*[FlexibleFrame ratio]);
            visualEfView.alpha = 0.5;
            visualEfView;
        });
        
    }
    return _visualEfView;

}


- (UIView *)topBgView{

    if (!_topBgView) {
        _topBgView = ({
            UIView *bgView = [[UIView alloc]initWithIPhone5Frame:CGRectMake(0, 0, 320, 64)];
            bgView.backgroundColor = [UIColor colorWithWhite:0.937 alpha:1.000];
            bgView;
        });
    }
    return _topBgView;

}


- (UIView *)buttomBgView{
    
    if (!_buttomBgView) {
        _buttomBgView = ({
            UIView *buttomBgView = [[UIView alloc]initWithIPhone5Frame:CGRectMake(0, 64, 320, 568-64)];
            buttomBgView.layer.shadowColor = [UIColor colorWithWhite:0.859 alpha:1.000].CGColor;
            buttomBgView.layer.shadowRadius = 10;
            buttomBgView.layer.shadowOpacity = 1;
            buttomBgView.layer.shadowOffset = CGSizeMake(4, 4);
            buttomBgView.backgroundColor = [UIColor colorWithWhite:0.937 alpha:1.000];
            buttomBgView;
        });
    }
    return _buttomBgView;
    
}


- (UIButton *)returnBtn{

    if (!_returnBtn) {
        _returnBtn = ({
        
            UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            returnBtn.frame = CGRectMake(15*[FlexibleFrame ratio], 6*[FlexibleFrame ratio], 64*[FlexibleFrame ratio], 64*[FlexibleFrame ratio]);
            [returnBtn setTitle:@"返回" forState:UIControlStateNormal];
            returnBtn.titleLabel.font = Font;
            [returnBtn setTitleColor:[UIColor colorWithRed:0.839 green:0.522 blue:0.282 alpha:1.000] forState:UIControlStateNormal];
            [returnBtn addTarget:self action:@selector(returnPressAction:) forControlEvents:UIControlEventTouchUpInside];
            returnBtn;
        });
    }
    return _returnBtn;
}


- (UIButton *)titleBtn{

    if (!_titleBtn) {
        _titleBtn = ({
            UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            returnBtn.frame = CGRectMake((320/2-64/2)*[FlexibleFrame ratio], 6*[FlexibleFrame ratio], 64*[FlexibleFrame ratio], 64*[FlexibleFrame ratio]);
            [returnBtn setTitle:@"注册" forState:UIControlStateNormal];
            returnBtn.titleLabel.font = Font;
            [returnBtn setTitleColor:[UIColor colorWithRed:0.839 green:0.522 blue:0.282 alpha:1.000] forState:UIControlStateNormal];
            returnBtn;
        });
    }
    return _titleBtn;

}

- (UIButton *)addPIcBtn{
    if (!_addPIcBtn) {
        _addPIcBtn = ({
        
            UIButton *addPicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            addPicBtn.frame = CGRectMake(((320/2)-152/2)*[FlexibleFrame ratio], 0*[FlexibleFrame ratio], 152*[FlexibleFrame ratio], 128*[FlexibleFrame ratio]);
            [addPicBtn setImage:[UIImage imageNamed:@"jihao3"] forState:UIControlStateNormal];
            addPicBtn;
        
        });
    }
    return _addPIcBtn;

}


- (UIButton *)getCodeBtn{
    if (!_getCodeBtn) {
        _getCodeBtn = ({
        
            UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [codeBtn setBackgroundImage:[UIImage imageNamed:@"register_verify"] forState:UIControlStateNormal];
            [codeBtn setTitle:@"获取" forState:UIControlStateNormal];
            codeBtn.frame = CGRectMake((40+240-59)*[FlexibleFrame ratio], 150*[FlexibleFrame ratio], 59*[FlexibleFrame ratio], 50*[FlexibleFrame ratio]);
            [codeBtn addTarget:self action:@selector(getCodeAction:) forControlEvents:UIControlEventTouchUpInside];
            codeBtn;
        
        });
    }
    return _getCodeBtn;


}


- (UIImageView *)textFieldImaeView{
    if (!_textFieldImaeView) {
        _textFieldImaeView = [[UIImageView alloc]initWithIPhone5Frame:CGRectMake(40, 200, 240, 47)];
        _textFieldImaeView.image = [UIImage imageNamed:@"login_textFieldBg"];
    }
    return _textFieldImaeView;


}


- (UIButton *)regBtn{

    if (!_regBtn) {
        _regBtn = ({
        
            UIButton *regBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            regBtn.frame = CGRectMake(80*[FlexibleFrame ratio], 400*[FlexibleFrame ratio], 150*[FlexibleFrame ratio], 45*[FlexibleFrame ratio]);
            [regBtn setBackgroundImage:[UIImage imageNamed:@"registerBtn"] forState:UIControlStateNormal];;
            [regBtn addTarget:self action:@selector(regAction:) forControlEvents:UIControlEventTouchUpInside];
            regBtn;
        });
    }
    return _regBtn;

}


- (UIButton *)submitBtn{
    if (!_submitBtn) {
        _submitBtn = ({
            
            UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            submitBtn.frame = CGRectMake(200*[FlexibleFrame ratio], 350*[FlexibleFrame ratio], 60*[FlexibleFrame ratio], 45*[FlexibleFrame ratio]);
            [submitBtn setTitle:@"登录" forState:UIControlStateNormal];
            submitBtn.titleLabel.textAlignment  = NSTextAlignmentLeft;
            submitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [submitBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [submitBtn addTarget:self action:@selector(subAction:) forControlEvents:UIControlEventTouchUpInside];
            submitBtn;
        });
    }
    return _submitBtn;

}


- (void)initlizeDataSource{

    self.textPlaceFieldArray = @[@"请输入手机号码",@"手机验证码",@"请输入6-20位密码"];
    self.textFieldArray      = [[NSMutableArray alloc]init];
}


- (void)initlizeAppearance{
    self.view.backgroundColor = [UIColor colorWithWhite:0.937 alpha:1.000];
    [self.view addSubview:self.topBgView];
    [self.view addSubview:self.buttomBgView];
    [_topBgView addSubview:self.returnBtn];
    [_topBgView addSubview:self.titleBtn];
    [_buttomBgView addSubview:self.addPIcBtn];
    [self addInputView];
    [_buttomBgView addSubview:self.getCodeBtn];
    [_buttomBgView addSubview:self.regBtn];
    [self haveSubmitLabel];
    [_buttomBgView addSubview:self.submitBtn];

}

#pragma mark - 生成输入的文本控件
- (void)addInputView{
    for (int i = 0;  i < 3; i ++) {
        UIImageView *textFieldImaeView = [[UIImageView alloc]initWithIPhone5Frame:CGRectMake(40, 150 + (i*(47+20)), 240, 50)];
        textFieldImaeView.image = [UIImage imageNamed:@"login_textFieldBg"];
        [_buttomBgView addSubview:textFieldImaeView];
        UITextField *textfield = [[UITextField alloc]initWithIPhone5Frame:CGRectMake(60, 150 + (i*(47+20)), 163, 50)];
        textfield.tag = i;
        textfield.placeholder = _textPlaceFieldArray[i];
        [_textFieldArray addObject:textfield];
        textfield.delegate = self;
        textfield.textColor = [UIColor colorWithWhite:0.200 alpha:1.000];
        textfield.secureTextEntry = i == 2 ? YES: NO;
        [_buttomBgView addSubview:textfield];
    }
}

#pragma mark - 生成已有账号的文本控件

- (void)haveSubmitLabel{

    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake((200-64)*[FlexibleFrame ratio], 350*[FlexibleFrame ratio], 80*[FlexibleFrame ratio], 45*[FlexibleFrame ratio]);
    [submitBtn setTitle:@"已有账号?" forState:UIControlStateNormal];
    submitBtn.titleLabel.textAlignment  = NSTextAlignmentRight;
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [submitBtn setTitleColor: [UIColor colorWithRed:0.722 green:0.722 blue:0.753 alpha:1.000] forState:UIControlStateNormal];
    [_buttomBgView addSubview:submitBtn];
}




#pragma mark - 返回按钮事件


- (void)returnPressAction:(UIButton *)sender{

    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 发送验证码按钮事件

- (void)getCodeAction:(UIButton *)sender{



}


#pragma mark - 注册按钮事件

- (void)regAction:(UIButton *)sender{
    
    
    
}

#pragma mark - 已有账号登录按钮事件

- (void)subAction:(UIButton *)sender{
    
    [self.presentingViewController dismissViewControllerAnimated:NO completion:^{
        
    }];
    
}


#pragma mark - textField的协议方法


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    if (textField.tag == 0) {
        return textField.text.length > 11 ? NO:YES;
    }
    if (textField.tag == 1) {
        return textField.text.length > 3 ?  NO:YES;
    }
    if (textField.tag == 2) {
        return textField.text.length > 16 ?  NO:YES;
    }
    return YES;
}










@end
