//
//  GoodBaseTableView.h
//  GoodUITableView
//
//  Created by 高向孚 on 5/6/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodTableViewDataSource.h"

@class GoodTableViewSectionObject;
@protocol GoodTableViewDelegate <UITableViewDelegate>
@optional
/**
 * 选择一个cell的回调，并返回被选择cell的数据结构和indexPath
 */
- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath*)indexPath;

- (UIView *)headerViewForSectionObject:(GoodTableViewSectionObject *)sectionObject atSection:(NSInteger)section;
// 将来可以有 cell 的编辑，交换，左滑等回调

// 这个协议继承了UITableViewDelegate ，所以自己做一层中转，VC 依然需要实现某些代理方法。
@end
@interface GoodBaseTableView : UITableView <UITableViewDelegate>
@property(nonatomic,assign) id<GoodTableViewDataSource> goodDataSource;
@property(nonatomic,assign) id<GoodTableViewDelegate> goodDelegate;
@end
