//
//  MyViewController.m
//  微信
//
//  Created by qingyun on 16/5/18.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import "MyViewController.h"
#import "GroupView.h"
#import "QQGroups.h"
#import "FriendsTableViewCell.h"
@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong) NSArray *groups;
@end

@implementation MyViewController
- (NSArray *)groups{
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"friends" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *groups = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            QQGroups *group = [QQGroups groupWithDictionary:dic];
            [groups addObject:group];
        }
        _groups =groups;
    }
    return _groups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:0 target:self action:@selector(editAction:)];
    self.navigationItem.rightBarButtonItem = leftItem;
    [_tableView registerClass:[FriendsTableViewCell class] forCellReuseIdentifier:@"friend"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)editAction:(UIBarButtonItem *)barButtonItem {
    if ([barButtonItem.title isEqualToString:@"编辑"]) {
        [self.tableView setEditing:YES animated:YES];
        barButtonItem.title = @"完成";
    }else if ([barButtonItem.title isEqualToString:@"完成"]){
        [self.tableView setEditing:NO animated:YES];
        barButtonItem.title = @"编辑";
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    QQGroups *groups = self.groups[section];
    return groups.isOn ? groups.friends.count : 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friend" forIndexPath:indexPath];
    //获取当前cell所在的section对应的模型
    QQGroups *heroGroup = self.groups[indexPath.section];
    //获取当前cell对应的模型
    QQFriends *hero = heroGroup.friends[indexPath.row];
    
    cell.friendsData = hero;
    
    return cell;
}
//设置section的头视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0;
}

//设置section的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    GroupView *sectionHeaderView = [GroupView sectionHeaderView:tableView];
    
    //获取当前cell所在的section对应的模型
    QQGroups *heroGroup = self.groups[section];
    sectionHeaderView.QQgroups = heroGroup;
    
    sectionHeaderView.headViewClick = ^{
        [_tableView reloadData];
    };
    
    return sectionHeaderView;
}

@end
