//
//  ViewController.m
//  XAddedViewDemo
//
//  Created by mt on 16/8/3.
//  Copyright © 2016年 mt. All rights reserved.
//

#import "ViewController.h"

#import <Masonry.h>

#import "XTableViewAddedView.h"

@interface ViewController () <UITableViewDelegate ,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    {   //header
        XTableViewAddedView *tableHeader = [[XTableViewAddedView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
        tableView.tableHeaderView = tableHeader;
        
        tableHeader.backgroundColor = [UIColor yellowColor];
        
        UIView *view = [UIView new];
        [tableHeader.contentView addSubview:view];
        
        view.backgroundColor = [UIColor redColor];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(50);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.bottom.mas_equalTo(-50);
            make.centerX.mas_equalTo(0);
        }];
    }
    
    {   //Footer
        XTableViewAddedView *tableHeader = [[XTableViewAddedView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
        tableView.tableFooterView = tableHeader;
        
        tableHeader.backgroundColor = [UIColor yellowColor];
        
        UIView *view = [UIView new];
        [tableHeader.contentView addSubview:view];
        
        view.backgroundColor = [UIColor redColor];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(50);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.bottom.mas_equalTo(-50);
            make.centerX.mas_equalTo(0);
        }];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
