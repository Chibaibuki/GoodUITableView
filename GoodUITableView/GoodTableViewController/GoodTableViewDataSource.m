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
 *  用来拆离二维数组数据结构
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
/**
 *  默认的返回一个GoodBaseTableViewCell类型，子类可以重写这个方法来提供更多的Cell类型
 *
 *  @param tableView 装填数据的tableview
 *  @param object    数据元素
 *
 *  @return 返回Cell类型
 */
-(Class)tableView:(UITableView *)tableView cellClassForObject:(GoodTableViewBaseItem *)object{
    return [GoodBaseTableViewCell class];
}

#pragma mark - UITableViewDataSource Required
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.sections.count > section) {
        //取出一个Obejct弹匣并返回数量
        GoodTableViewSectionObject *sectionObject =  [self.sections objectAtIndex:section];
        return sectionObject.items.count;
    }else return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodTableViewBaseItem * object = [self tableView:tableView objectForRowAtIndexPath:indexPath]; //拿个数据
    Class cellClass = [self tableView:tableView cellClassForObject:object];
    NSString *className = [NSString stringWithUTF8String:class_getName(cellClass)];
    GoodBaseTableViewCell* cell = (GoodBaseTableViewCell*)[tableView dequeueReusableCellWithIdentifier:className];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:className];
    }
    [cell setObject:object];
    
    return cell;
    
}

#pragma mark - UITableViewDataSource Optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sections ? self.sections.count : 0;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.sections.count > section) {
        GoodTableViewSectionObject *sectionObject = [self.sections objectAtIndex:section];
        return sectionObject.headerTitle;
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (self.sections.count > section) {
        GoodTableViewSectionObject *sectionObject = [self.sections objectAtIndex:section];
        if (sectionObject != nil && sectionObject.footerTitle != nil && ![sectionObject.footerTitle isEqualToString:@""]) {
            return sectionObject.footerTitle;
        }
    }
    return nil;
}




@end
