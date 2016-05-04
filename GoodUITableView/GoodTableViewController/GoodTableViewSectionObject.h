//
//  GoodTableViewSectionObject.h
//  GoodUITableView
//
//  Created by 高向孚 on 4/26/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodTableViewSectionObject : NSObject
@property(nonatomic,copy)NSString *headerTitle;
@property(nonatomic,copy)NSString *footerTitle;
@property(nonatomic,retain)NSMutableArray * items;

-(instancetype)initWithItemArray:(NSMutableArray *)items;

@end
