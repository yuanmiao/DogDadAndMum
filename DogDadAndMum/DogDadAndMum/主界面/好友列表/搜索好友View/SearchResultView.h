//
//  SearchResultView.h
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/30.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchResultView : UIView<UITableViewDataSource,UITableViewDelegate>



- (void)noFindFriend:(NSString *)str;


@end
