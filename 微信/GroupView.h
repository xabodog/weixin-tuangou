//
//  GroupView.h
//  QQ好友
//
//  Created by qingyun on 16/5/17.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQGroups;
@interface GroupView : UITableViewHeaderFooterView
@property (nonatomic,strong) QQGroups *QQgroups;
@property (nonatomic,copy) void (^headViewClick)();
+(instancetype)sectionHeaderView:(UITableView *)tableView;
@end
