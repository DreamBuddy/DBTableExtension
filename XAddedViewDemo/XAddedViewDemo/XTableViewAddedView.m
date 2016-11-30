//
//  XTableViewAddedView.m
//  OneLucky
//
//  Created by mt on 16/8/3.
//  Copyright © 2016年 mt. All rights reserved.
//

#import "XTableViewAddedView.h"

///weakSelf
#define ONE_WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@implementation XTableViewAddedView

+(XTableViewAddedView *)factoryMakerWidth:(CGFloat)width containView:(UIView *)containView{
    XTableViewAddedView *headerView = [[XTableViewAddedView alloc]initWithFrame:CGRectMake(0, 0, width, 10)];
    [headerView.contentView addSubview:containView];
    
    containView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [headerView addConstraints:@[
                                 [NSLayoutConstraint constraintWithItem:containView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:headerView.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                 [NSLayoutConstraint constraintWithItem:containView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
                                 [NSLayoutConstraint constraintWithItem:containView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:headerView.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
                                 [NSLayoutConstraint constraintWithItem:containView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:headerView.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]
                                 ]];
    
    return headerView;
}

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self _commonInit];
        
        [self commonInit];
    }
    return self;
}

-(void)_commonInit{
    self.contentView = [XTableViewContentView new];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.contentView];
    
    [self addConstraints:@[
                           [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]
                           ]];
    
    ONE_WS(weakSelf)
    [self.contentView setXLayoutCallback:^(CGRect rect){
        weakSelf.frame = CGRectMake(weakSelf.frame.origin.x, weakSelf.frame.origin.y, rect.size.width, rect.size.height);
        
        UITableView *tableView = (UITableView *)weakSelf.x_getMyTableView;
        if (tableView.tableFooterView == weakSelf) {
            tableView.tableFooterView = weakSelf;
        }else if (tableView.tableHeaderView == weakSelf) {
            tableView.tableHeaderView = weakSelf;
        }
    }];
}

-(void)commonInit{
    //子类重写
}

@end

@implementation UIView (XTableView)

-(UIView *)x_getMyTableView{
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]]) {
        tableView = tableView.superview;
    }
    
    return tableView;
}

@end

@implementation XTableViewContentView

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.XLayoutCallback) {
        self.XLayoutCallback(self.frame);
    }   
}

@end
