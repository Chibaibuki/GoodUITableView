//
//  GoodBaseTableViewCell.m
//  GoodUITableView
//
//  Created by 高向孚 on 5/4/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import "GoodBaseTableViewCell.h"
#import "GoodTableViewBaseItem.h"
//#import "<#header#>"

@implementation GoodBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setObject:(GoodTableViewBaseItem *)object{
    self.imageView.image = object.itemImage;
    self.textLabel.text = object.itemTitle;
    self.detailTextLabel.text = object.itemSubtitle;
    self.accessoryView = [[UIImageView alloc]initWithImage:object.itemAccessoryImage];
}

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(GoodTableViewBaseItem *)object {
    return 44.0f;
}

@end
