//
//  FlexibleFrame.m
//  demo
//
//  Created by 小宸宸Dad on 15/6/26.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "FlexibleFrame.h"


@implementation FlexibleFrame



+ (CGFloat)ratio{

    return SCREEN_SIZE.height/IPHONE5_SIZE.height;

}



+ (CGRect)frameWithIPhone5Frame:(CGRect)IPhpone5frame{

    CGFloat x = IPhpone5frame.origin.x * [self ratio];
    CGFloat y = IPhpone5frame.origin.y * [self ratio];
    CGFloat width = IPhpone5frame.size.width *[self ratio];
    CGFloat height = IPhpone5frame.size.height *[self ratio];
    return CGRectMake(x, y, width, height);
}

@end
