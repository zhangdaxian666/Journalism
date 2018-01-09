//
//  ViewController.m
//  networking
//
//  Created by slcf888 on 2017/12/13.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "Network.h"
#import "Model.h"
#import <MJRefresh.h>
#import "SecondController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *mutArray;
@property (nonatomic, strong) UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"Next";

    [self loadNewData];
    [self initUI];

}

- (NSMutableArray *)mutArray
{
    if (!_mutArray) {
        _mutArray =[NSMutableArray new];
    }
    return _mutArray;
}
- (void)initUI
{
    _tableview =[[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableview.delegate =self;
    _tableview.dataSource =self;
    _tableview.rowHeight =120;
    _tableview.scrollEnabled =YES; //设置滚动
    [self.view addSubview:_tableview];
    
    self.tableview.mj_header =[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    self.tableview.mj_footer =[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
- (void)loadNewData
{
    NSString *urlstr =[NSString stringWithFormat:@"http://v.juhe.cn/toutiao/index?type=&key=b8421e57e460addf33510c67277d45e6"];
    Network *network =[Network new];
    [network getDataWithUrlString:urlstr];
    [network setBlock:^(id info) {  //block 请求成功后的处理
        NSArray *banner =info[@"result"][@"data"];
        [_mutArray removeAllObjects];
        for (int i=0; i<banner.count; i++) {
            Model *model =[[Model alloc]init];
            NSString *url =[banner[i] objectForKey:@"url"];
            if (url) {
                model.url =url;
            }else if (url ==nil){
                url =@"http://www.jianshu.com/p/4ea427bab0af";
                model.url =url;
            }
            NSString *title =[banner[i] objectForKey:@"title"];
            if (title) {
                [title stringByRemovingPercentEncoding];
                model.title =title;
            }
            NSString *img =[banner[i] objectForKey:@"thumbnail_pic_s"];
            if (img) {
                model.image =img;
            }else if (img ==nil){
                img =@"http://img.qdaily.com/article/article_show/20161110122926LJBdCEmQtRVzhGji.png?imageMogr2/auto-orient/thumbnail/!640x380r/gravity/Center/crop/640x380/quality/85/format/jpg/ignore-error/1";
                model.image =img;
            }
            [_mutArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableview reloadData];
            [self.tableview.mj_header endRefreshing];
        });
    }];
}
- (void)loadMoreData
{
    NSString *url =@"http://app3.qdaily.com/app3/homes/index/1478819276_1478777270.json?";
    Network *network =[Network new];
    [network getDataWithUrlString:url];
    [network setBlock:^(id info) {
        NSArray *banner =info[@"response"][@"feeds"];
        for (int i=0; i<banner.count; i++) {
            NSDictionary *banners =[banner[i] objectForKey:@"post"];
            Model *model =[[Model alloc]init];
            NSString *url =[banners objectForKey:@"appview"];
            if (url) {
                model.url =url;
            }else if (url ==nil){
                url =@"http://www.jianshu.com/p/4ea427bab0af";
                model.url =url;
            }
            NSString *title =[banners objectForKey:@"title"];
            if (title) {
                [title stringByRemovingPercentEncoding];
                model.title =title;
            }
            NSString *img =[banner[i] objectForKey:@"image"];
            if (img) {
                model.image =img;
            }else if (img ==nil){
                img =@"http://img.qdaily.com/article/article_show/20161110122926LJBdCEmQtRVzhGji.png?imageMogr2/auto-orient/thumbnail/!640x380r/gravity/Center/crop/640x380/quality/85/format/jpg/ignore-error/1";
                model.image =img;
            }
            [_mutArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableview reloadData];
            [self.tableview.mj_header endRefreshing];
            [self.tableview.mj_footer resetNoMoreData]; //重置没有更多的数据
        });
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mutArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID =@"cell";
    TableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell ==nil) {
        cell =[[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil]lastObject];
    }
    Model *model =self.mutArray[indexPath.row];
    cell.model =model;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Model *model =_mutArray[indexPath.row];
    [self pushToWebViewControllerWithNewsUrl:model.url];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)pushToWebViewControllerWithNewsUrl:(NSString *)newsUrl
{
    SecondController *second =[[SecondController alloc]init];
    second.urlstring =newsUrl;
    [self.navigationController pushViewController:second animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
