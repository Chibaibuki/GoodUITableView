//
//  ViewController.m
//  GoodUITableView
//
//  Created by 高向孚 on 4/19/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDataSource.h"

@interface ViewController () <UITableViewDelegate>
@property (strong,nonatomic)TableViewDataSource *aDataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView * aTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    self.aDataSource = [[TableViewDataSource alloc]init];
    aTableView.delegate      = self;
    aTableView.dataSource    = self.aDataSource;
    
    [self.view addSubview:aTableView];
}

#pragma mark - UITableViewDelegate
/*
 Put some delegate methods here.
 */




@end
