//
//  RecentTableViewCell.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/29.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "RecentTableViewCell.h"

@interface RecentTableViewCell ()

@property (strong,nonatomic)UIView *lineView;


@end


@implementation RecentTableViewCell



- (UIImageView *)picImageView{

    if (!_picImageView) {
        _picImageView = ({
        
            UIImageView *pic = [[UIImageView alloc]initWithIPhone5Frame:CGRectMake(5, 20, 45, 45)];
            pic.layer.cornerRadius = 45/2;
            pic.clipsToBounds = YES;
            pic;
        
        });
    }
    return _picImageView;

}


- (UILabel *)userNameLabel{

    if (!_userNameLabel) {
        _userNameLabel = ({
            
            UILabel *user = [[UILabel alloc]initWithIPhone5Frame:CGRectMake(60, 14, 172, 21)];
            user.textColor = [UIColor colorWithWhite:0.165 alpha:1.000];
            user.font = [UIFont systemFontOfSize:18];
            user.text = @"2222";
            user;
            
        });
    }
    return _userNameLabel;
}


- (UILabel *)timeLabel{
    
    if (!_timeLabel) {
        _timeLabel = ({
            
            UILabel *timeLabel = [[UILabel alloc]initWithIPhone5Frame:CGRectMake(320-70, 14, 60, 21)];
            timeLabel.textColor = [UIColor colorWithRed:0.000 green:0.463 blue:0.800 alpha:1.000];
            timeLabel.font = [UIFont systemFontOfSize:14];
            timeLabel.text = @"10月21日";
            timeLabel;
            
        });
    }
    return _timeLabel;
}




- (UILabel *)messageLabel{
    
    if (!_messageLabel) {
        _messageLabel = ({
            
            UILabel *user = [[UILabel alloc]initWithIPhone5Frame:CGRectMake(60, 40, 172, 21)];
            user.textColor = [UIColor colorWithWhite:0.459 alpha:1.000];
            user.font = [UIFont systemFontOfSize:16];
            user.text = @"111";
            user;
            
        });
    }
    return _messageLabel;
}



- (UIView *)lineView{

    if (!_lineView) {
        _lineView = ({
        
            UIView *line = [[UIView alloc]initWithIPhone5Frame:CGRectMake(0, 79, 320, 1)];
            line.backgroundColor = [UIColor colorWithRed:0.745 green:0.741 blue:0.765 alpha:0.6];
            line;
        });
    }
    return _lineView;

}


- (UIImageView *)rightminiView{

    if (!_rightminiView) {
        _rightminiView = ({
        
            UIImageView *imageView = [[UIImageView alloc]initWithIPhone5Frame:CGRectMake(280, 40, 30, 30)];
            imageView.image = [UIImage imageNamed:@"iconfont-msnui-rightmini"];
            imageView.hidden = YES;
            imageView;
        });
    }
    return _rightminiView;

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.picImageView];
        [self addSubview:self.userNameLabel];
        [self addSubview:self.messageLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.lineView];
        [self addSubview:self.rightminiView];
    }
    return self;

}



@end
