//
//  ViewController.m
//  微信
//
//  Created by qingyun on 16/5/18.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import "ViewController.h"
#import "QYTGModel.h"
#import "QYTGCell.h"
#import "ResultTableViewController.h"
#import "webVC.h"
@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)UIScrollView * topView;
@property (nonatomic, strong)NSArray *datas;
@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation ViewController

-(NSArray *)datas{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"tgs" ofType:@"plist"];
        NSArray *array = [[NSArray alloc]initWithContentsOfFile:path];
        NSMutableArray * mularry = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            QYTGModel *model = [QYTGModel tgModelWithDictionary:dic];
            [mularry addObject:model];
        }
        _datas=mularry;
    }
    return _datas;
}

-(UISearchController *)searchController{
    if (_searchController == nil) {
        ResultTableViewController *resultVC = [[ResultTableViewController alloc]initWithStyle:UITableViewStylePlain];
        resultVC.willFilterArray = self.datas;
        _searchController = [[UISearchController alloc]initWithSearchResultsController:resultVC];
        _searchController.searchResultsUpdater = resultVC;
        _searchController.hidesNavigationBarDuringPresentation = YES;
    }
    return  _searchController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"团购";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:0 target:self action:@selector(editAction:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIScrollView *topView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 375, 100)];
    topView.contentSize = CGSizeMake(375*3, 100);
    topView.pagingEnabled = YES;
    topView.delegate =self;
    topView.showsHorizontalScrollIndicator =NO;
    
    [self.view addSubview:topView];
    for (int i; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0+375*i, 20, 375, 100)];
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d@2x",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        [topView addSubview:imageView];
    }
    _topView = topView;
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

- (void)searchAction:(UIBarButtonItem *)sender{
    [self presentViewController:self.searchController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QYTGModel *model = self.datas[indexPath.row];
    QYTGCell *message =[tableView dequeueReusableCellWithIdentifier:@"message"forIndexPath:indexPath];
    message.tgModel = model;
    return message;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    webVC *web = [[webVC alloc]init];
    [self.navigationController pushViewController:web animated:NO];
    
}

#pragma mark - edit
//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}
//
//-(NSArray <UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//
//    UITableViewRowAction *rowAction1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        //1.删除数据(数据)
//        [array removeObjectAtIndex:indexPath.row];
//        //2.删除行(界面)
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        
//    }];
//    return rowAction1;
//}
@end
