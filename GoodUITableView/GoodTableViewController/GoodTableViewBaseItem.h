//
//  GoodTableViewBaseItem.h
//  GoodUITableView
//
//  Created by 高向孚 on 4/24/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXPORT CGFloat const CellInvailidHeight;

@interface GoodTableViewBaseItem : NSObject
@property (nonatomic, assign)CGFloat cellHeight;

@property (nonatomic, retain) NSString *itemIdentifier;
@property (nonatomic, retain) UIImage *itemImage;
@property (nonatomic, retain) NSString *itemTitle;
@property (nonatomic, retain) NSString *itemSubtitle;
@property (nonatomic, retain) UIImage *itemAccessoryImage;

-(instancetype)initWithItemImage:(UIImage*)image Title:(NSString*)Title Subtitle:(NSString*)title AccessoryImage:(UIImage *)accessoryImage;

@end
