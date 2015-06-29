//
//  LoadingView.h
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/27.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView


@property (strong,nonatomic)UIImageView *loadView;


/**
 *  开始加载
 */
- (void)startLoading;

/**
 *  停止加载
 */
- (void)stopLoading;


@end
