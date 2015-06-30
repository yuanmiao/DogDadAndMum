//
//  MoreViewCell.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/29.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "MoreViewCell.h"
#define CELL_HEIGHT 80
#define CELL_PIC_HEIGHT 30


@implementation MoreViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *bgView = [[UIView alloc]initWithIPhone5Frame:CGRectMake(0, 0, 200, CELL_HEIGHT)];
        bgView.backgroundColor = [UIColor colorWithRed:0.227 green:0.227 blue:0.243 alpha:1.000];
        UIView *line = [[UIView alloc]initWithIPhone5Frame:CGRectMake(CELL_PIC_HEIGHT+10, CELL_HEIGHT-2, 200-CELL_HEIGHT, 1)];
        line.backgroundColor = [UIColor colorWithRed:0.349 green:0.345 blue:0.365 alpha:1.000];
        [bgView addSubview:self.cellTitleLabel];
        [bgView addSubview:self.picImageView];
//        [bgView addSubview:line];
        [self addSubview:bgView];
    }
    return self;


}


- (UILabel *)cellTitleLabel{

    if (!_cellTitleLabel) {
        _cellTitleLabel = [[UILabel alloc]initWithIPhone5Frame:CGRectMake(CELL_PIC_HEIGHT+20, 0, 200-CELL_PIC_HEIGHT, CELL_HEIGHT)];
        _cellTitleLabel.font = [UIFont systemFontOfSize:18];
        _cellTitleLabel.textColor = [UIColor whiteColor];
        _cellTitleLabel.text = @"添加朋友";
    }
    return _cellTitleLabel;

}

- (UIImageView *)picImageView{
    
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc]initWithIPhone5Frame:CGRectMake(5, (CELL_HEIGHT - CELL_PIC_HEIGHT)/2 , CELL_PIC_HEIGHT, CELL_PIC_HEIGHT)];
        _picImageView.image = [UIImage imageNamed:@"iconfont-tianjiahaoyou"];
    }
    return _picImageView;
    
}









@end
