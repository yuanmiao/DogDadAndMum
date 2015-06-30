//
//  RecentTableViewCell.h
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/29.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecentTableViewCell : UITableViewCell

/**
 *  头像
 */
@property (strong, nonatomic) UIImageView *picImageView;

/**
 *  用户名
 */
@property (strong, nonatomic) UILabel *userNameLabel;

/**
 *  时间
 */
@property (strong, nonatomic) UILabel *timeLabel;
/**
 *  信息
 */
@property (strong, nonatomic) UILabel *messageLabel;

/**
 *  右边小箭头
 */
@property (strong, nonatomic) UIImageView *rightminiView;












@end
