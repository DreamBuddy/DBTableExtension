//
//  XTableViewAddedView.h
//  OneLucky
//
//  Created by mt on 16/8/3.
//  Copyright © 2016年 mt. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 本类的目的是 让 TableHeaderView 和 TableFooterView 可以使用AL */

@class XTableViewContentView;

@interface XTableViewAddedView : UIView

@property (nonatomic ,strong) XTableViewContentView *contentView;

///子类重写
-(void)commonInit;

@end

@interface UIView (XTableView)

-(UIView *)x_getMyTableView;

@end

@interface XTableViewContentView : UIView

@property (nonatomic ,copy) void(^XLayoutCallback)(CGRect rect);

@end
