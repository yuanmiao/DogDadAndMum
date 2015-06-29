//
//  UIView+Flexible.m
//  demo
//
//  Created by 小宸宸Dad on 15/6/26.
//  Copyright (c) 2015年 fj. All rights reserved.
//
#import "FlexibleFrame.h"


@implementation UIView (Flexible)


- (instancetype)initWithIPhone5Frame:(CGRect)frame{
    self = [self initWithFrame:[FlexibleFrame frameWithIPhone5Frame:frame]];
    return self;
}

@end
