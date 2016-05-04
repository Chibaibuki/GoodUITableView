//
//  GoodTableViewDataSource.h
//  GoodUITableView
//
//  Created by 高向孚 on 5/4/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GoodTableViewBaseItem;
@protocol GoodTableViewDataSource <UITableViewDataSource>


@optional
- (GoodTableViewBaseItem *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath;
- (Class)tableView:(UITableView *)tableView cellClassForObject:(GoodTableViewBaseItem *)object;

@end

@interface GoodTableViewDataSource : NSObject <GoodTableViewDataSource>

@property (nonatomic,strong)NSMutableArray *sections;

@end
