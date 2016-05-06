//
//  GoodBaseTableView.m
//  GoodUITableView
//
//  Created by 高向孚 on 5/6/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import "GoodBaseTableView.h"
#import "GoodBaseTableViewCell.h"
#import "GoodTableViewSectionObject.h"
#import "GoodTableViewBaseItem.h"

@implementation GoodBaseTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.separatorColor = [UIColor clearColor];
        self.showsVerticalScrollIndicator = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.sectionHeaderHeight = 0;
        self.sectionFooterHeight = 0;
        self.delegate = self;
    }
    return self;
}

-(void)setGoodDataSource:(id<GoodTableViewDataSource>)goodDataSource{
    if (_goodDataSource!= goodDataSource) {
        _goodDataSource = goodDataSource;
//这里把父类的数据源也设置成了好~数据源
        self.dataSource= goodDataSource;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    id<GoodTableViewDataSource> dataSource = (id<GoodTableViewDataSource>)tableView.dataSource;
    
    GoodTableViewBaseItem *object = [dataSource tableView:tableView objectForRowAtIndexPath:indexPath];
    Class cls = [dataSource tableView:tableView cellClassForObject:object];
    
    if (object.cellHeight == CellInvalidHeight) { // 没有高度缓存
        object.cellHeight = [cls tableView:tableView rowHeightForObject:object];
    }
    return object.cellHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.goodDelegate respondsToSelector:@selector(didSelectObject:atIndexPath:)]) {
        id<GoodTableViewDataSource> dataSource = (id<GoodTableViewDataSource>)tableView.dataSource;
        id object = [dataSource tableView:tableView objectForRowAtIndexPath:indexPath];
        [self.goodDelegate didSelectObject:object atIndexPath:indexPath];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    else if ([self.goodDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.goodDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if ([self.goodDelegate respondsToSelector:@selector(headerViewForSectionObject:atSection:)]) {
        id<GoodTableViewDataSource> dataSource = (id<GoodTableViewDataSource>)tableView.dataSource;
        GoodTableViewSectionObject *sectionObject = [((GoodTableViewDataSource *)dataSource).sections objectAtIndex:section];
        
        return [self.goodDelegate headerViewForSectionObject:sectionObject atSection:section];
    }
    else if ([self.goodDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        return [self.goodDelegate tableView:tableView viewForHeaderInSection:section];
    }
    return nil;
}

#pragma mark - 传递原生协议

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.goodDelegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        [self.goodDelegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}
@end
