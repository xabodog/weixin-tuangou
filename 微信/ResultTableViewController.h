//
//  ResultTableViewController.h
//  微信
//
//  Created by qingyun on 16/5/25.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewController : UITableViewController<UISearchResultsUpdating>
@property (nonatomic, strong) NSArray *willFilterArray;
@end
