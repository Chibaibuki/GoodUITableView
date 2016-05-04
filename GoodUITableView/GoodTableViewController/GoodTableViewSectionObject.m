//
//  GoodTableViewSectionObject.m
//  GoodUITableView
//
//  Created by 高向孚 on 4/26/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import "GoodTableViewSectionObject.h"

@implementation GoodTableViewSectionObject
-(instancetype)init{
    if (self) {
        self.headerTitle = @"";
        self.footerTitle = @"";
        self.items = [[NSMutableArray alloc]init];
    }
    return self;
}

-(instancetype)initWithItemArray:(NSMutableArray *)items{
    self = [self init];
    if(self){
        [self.items addObjectsFromArray:items];
    }
    return self;
}

@end
