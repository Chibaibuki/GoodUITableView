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
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    static NSString *AnotherTableIdentifier = @"AnotherTableIdentifier";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    UITableViewCell *cell;
    if (indexPath.row%2) {
        cell  = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];

    }else{
        cell  = [tableView dequeueReusableCellWithIdentifier:AnotherTableIdentifier];
    }
    
    if(cell == nil){
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
        if (indexPath.row%2) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
                cell.textLabel.text = [NSString stringWithFormat:@"%ld AndI'm the One",indexPath.row];
        }else{
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AnotherTableIdentifier];
                cell.textLabel.text = [NSString stringWithFormat:@"%ld AndI'm the Another",indexPath.row];
        }
    }

    return cell;
}

@end
