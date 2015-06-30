//
//  BaseViewController.h
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/26.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 *  左边的返回按钮
 */
@property (strong,nonatomic)UIBarButtonItem *leftButton;
- (void)initlizeDataSource;
- (void)initlizeAppearance;
- (instancetype)initWithTitle:(NSString *)title tabBarItemImage:(UIImage *)image selectImage:(UIImage *)selectImage;
@end
