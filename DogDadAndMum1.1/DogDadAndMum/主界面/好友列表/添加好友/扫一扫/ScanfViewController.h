//
//  ScanfViewController.h
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/30.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "BaseViewController.h"

/**
 *  扫描到条形码数据后，回传数据给代理
 */
@protocol ScanfViewControllerDelegate <NSObject>


- (void)scanfReturnData:(id)data;


@end

@interface ScanfViewController : BaseViewController


@property (strong,nonatomic)id<ScanfViewControllerDelegate>delegate;


@end
