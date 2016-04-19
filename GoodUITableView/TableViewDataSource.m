//
//  TableViewDataSource.m
//  GoodUITableView
//
//  Created by 高向孚 on 4/19/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import "TableViewDataSource.h"

@implementation TableViewDataSource

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
