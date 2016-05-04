//
//  GoodTableViewBaseItem.m
//  GoodUITableView
//
//  Created by 高向孚 on 4/24/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import "GoodTableViewBaseItem.h"

CGFloat const CellInvailidHeight = -1;


@implementation GoodTableViewBaseItem

-(instancetype)initWithItemImage:(UIImage *)image Title:(NSString *)Title Subtitle:(NSString *)title AccessoryImage:(UIImage *)accessoryImage{
    self = [super init];
    if (self) {
        self.cellHeight = CellInvailidHeight;
        self.itemImage = image;
        self.itemTitle = title;
        self.itemSubtitle  = title;
        self.itemAccessoryImage = accessoryImage;
    }
    return self;
}
@end
