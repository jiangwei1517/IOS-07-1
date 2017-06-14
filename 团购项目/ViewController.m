//
//  ViewController.m
//  团购项目
//
//  Created by jiangwei18 on 17/6/14.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingModel.h"
#import "FoodCellView.h"
#import "LoadMoreView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, LoadMoreViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (nonatomic, strong)NSMutableArray *datas;

@end

@implementation ViewController

- (void)footViewUpDate:(LoadMoreView *)loadMoreView {
    ShoppingModel *model = self.datas[0];
    [self.datas addObject:model];
    [self.mTableView reloadData];
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.datas.count - 1 inSection:0];
    [self.mTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (NSMutableArray *)datas {
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil];
        NSArray *tagArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *newDatas = [NSMutableArray new];
        for (NSDictionary* dict in tagArray) {
            ShoppingModel *model = [[ShoppingModel alloc]initWithDict:dict];
            [newDatas addObject:model];
        }
        _datas = newDatas;
    }
    return _datas;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodCellView *cell = [FoodCellView CellViewWithTableView:tableView];
    [cell setModel:self.datas[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mTableView.dataSource = self;
    self.mTableView.delegate = self;
    LoadMoreView *footView = [[[NSBundle mainBundle]loadNibNamed:@"LoadMore" owner:nil options:nil]firstObject];
    // 设置footView的代理
    self.mTableView.tableFooterView = footView;
    footView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
