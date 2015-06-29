//
//  FlexibleFrame.h
//  demo
//
//  Created by 小宸宸Dad on 15/6/26.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define IPHONE5_SIZE CGSizeMake(320,568)

@interface FlexibleFrame : NSObject



+ (CGFloat)ratio;

+ (CGRect)frameWithIPhone5Frame:(CGRect)IPhpone5frame;




@end
