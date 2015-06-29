//
//  LoadingView.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/27.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "LoadingView.h"


@interface LoadingView ()


@property (strong,nonatomic)NSTimer *timer;
@property (strong,nonatomic)NSArray *loadPicArray;

@end

@implementation LoadingView


- (NSArray *)loadPicArray{
    if (!_loadPicArray) {
        _loadPicArray = @[@"loading01.png",@"loading02.png",@"loading03.png",@"loading04.png",@"loading05.png",@"loading06.png"];
    }
    return _loadPicArray;
}


- (instancetype)initWithIPhone5Frame:(CGRect)frame{

    if (self = [super initWithIPhone5Frame:frame]) {
        
        _loadView = [[UIImageView alloc]initWithFrame:CGRectMake(130*[FlexibleFrame ratio], 250*[FlexibleFrame ratio], 60*[FlexibleFrame ratio], 68*[FlexibleFrame ratio])];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self addSubview:_loadView];
    }
    return self;
}


#pragma mark - 开始加载
- (void)startLoading{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

- (void)timerAction:(NSTimer *)timer{
    static int i = 0;
    if (i >= self.loadPicArray.count) {
        i = 0;
        return;
    }
    self.loadView.image = [UIImage imageNamed:self.loadPicArray[i++]];
}

#pragma mark - 停止加载

- (void)stopLoading{

    if ([self.timer isValid]) {
        _timer.fireDate = [NSDate distantFuture];
        _timer = nil;
    }

}



















@end
