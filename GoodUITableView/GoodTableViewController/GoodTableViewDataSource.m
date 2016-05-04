//
//  GoodTableViewDataSource.m
//  GoodUITableView
//
//  Created by 高向孚 on 5/4/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import "GoodTableViewDataSource.h"
#import "GoodBaseTableViewCell.h"
#import "GoodTableViewBaseItem.h"
#import "GoodTableViewSectionObject.h"


#import <objc/runtime.h>

@implementation GoodTableViewDataSource

#pragma mark - GoodTableViewDataSource
/**
 *  用来拆离二维数组数据结构来装填数据
 *
 *  @param tableView 装填数据的tableview
 *  @param indexPath 用来定位装填数据的Section/Row位置
 *
 *  @return 响应的Row数据
 */
- (GoodTableViewBaseItem *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sections.count>indexPath.section) { //越界判断
            GoodTableViewSectionObject *sectionObject = [self.sections objectAtIndex:indexPath.section];
        if (sectionObject.items.count > indexPath.row) {
            return [sectionObject.items objectAtIndex:indexPath.row];
        }
    }

    return nil;
}

///**
// *  返回所需的Cell类型
// *
// *  @param tableView 使用的tableview
// *  @param object    <#object description#>
// *
// *  @return <#return value description#>
// *
//-(Class)tableView:(UITableView *)tableView cellClassForObject:(GoodTableViewBaseItem *)object{
//    return [GoodBaseTableViewCell class];
//}

#pragma mark - UITableViewDataSource Required
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.sections.count > section) {
        //取出一个Obejct弹匣并返回数量
        GoodTableViewSectionObject *sectionObject =  [self.sections objectAtIndex:section];
        return sectionObject.items.count;
    }else return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
