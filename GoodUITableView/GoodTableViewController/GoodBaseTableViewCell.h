//
//  GoodBaseTableViewCell.h
//  GoodUITableView
//
//  Created by 高向孚 on 5/4/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GoodTableViewBaseItem;

@interface GoodBaseTableViewCell : UITableViewCell

@property (nonatomic,retain)id object;

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(GoodTableViewBaseItem *)object;

@end
