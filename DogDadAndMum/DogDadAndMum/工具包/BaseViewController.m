//
//  BaseViewController.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/26.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()




@end

@implementation BaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initlizeDataSource];
    [self initlizeAppearance];
    
}

- (UIBarButtonItem *)leftButton{
    
    if (!_leftButton) {
        _leftButton = ({
            
            UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"iconfont-fanhuiList"] style:UIBarButtonItemStylePlain target:self action:@selector(returnAction:)];
            leftButton;
        });
    }
    return _leftButton;
    
}


- (void)initlizeDataSource{


}
- (void)initlizeAppearance{
    
    self.view.backgroundColor = [UIColor whiteColor];

}




- (instancetype)initWithTitle:(NSString *)title tabBarItemImage:(UIImage *)image selectImage:(UIImage *)selectImage{
    if (self = [super init]) {
        self.title = title;
        UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:image tag:1];
        tabBarItem.selectedImage = selectImage;
        self.tabBarItem = tabBarItem;
    }
    return self;
    
}


- (void)returnAction:(UIBarButtonItem *)sender{

//    [self.view removeFromSuperview];

}


@end
