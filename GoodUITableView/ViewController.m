//
//  ViewController.m
//  GoodUITableView
//
//  Created by 高向孚 on 4/19/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView * aTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    aTableView.delegate      = self;
    aTableView.dataSource    = self;
    
    [self.view addSubview:aTableView];
}

#pragma mark - UITableViewDelegate
/*
 Put some delegate method here.
 */
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *aCell = [[UITableViewCell alloc]init];
    UILabel *aLabel        = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 200, 33)];
    aLabel.text            = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    [aCell addSubview:aLabel];
    
    return aCell;
}


@end
