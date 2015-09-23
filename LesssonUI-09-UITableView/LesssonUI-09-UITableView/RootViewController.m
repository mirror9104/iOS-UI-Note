//
//  RootViewController.m
//  LesssonUI-09-UITableView
//
//  Created by huchunyuan on 15/8/25.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

// 系统给我们提供了四种风格的cell
// UITableViewCellStyleDefault 没有detailTextLabel
// UITableViewCellStyleSubtitle detailTextLabel会在textLabel下方显示
// UItableViewCellStyleValue1 detailTextLabel会在textLabel右边显示
// UITableViewCellStyleValue2 没有ImageView detailTextLabel在textLabel旁边显示
#import "RootViewController.h"
#import "DetailViewController.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain)NSMutableDictionary *classDic;
@property (nonatomic,retain)NSMutableArray *allKeys;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"BJS150724花名册";
    // 布局tableView
    
    // 读取数据
    [self reloadData];
    
    [self layoutTableView];
}
- (void)reloadData{
    NSMutableArray *groupA=[NSMutableArray arrayWithObjects:@"孙毅",@"施永辉",@"王超",@"顾利",@"胡春源",@"李春菲", nil];
    NSMutableArray *groupB = [NSMutableArray arrayWithObjects:@"孙高杰",@"张莉",@"刘静",@"李胜男",@"江晨",@"张罡雷", nil];
    NSMutableArray *groupC = [NSMutableArray arrayWithObjects:@"李建行",@"张涛",@"夏汝震",@"宋秋均", nil];
    NSMutableArray  *groupD=  [ NSMutableArray arrayWithObjects:@"狄博超",@"姚力军",@"蔡献敏",@"马志威",@"于潘洋",@"宋静" ,nil];
    NSMutableArray *groupE = [NSMutableArray arrayWithObjects:@"伊秀利",@"庄媛",@"宁唯",@"佟锡杰",@"陈鹏举",@"李艳华", nil];
    NSMutableArray *groupF=[NSMutableArray arrayWithObjects:@"刘晔琦", @"陈玉亮",@"赵小磊",@"校付萍",@"位丹丹",@"汪磊",nil];
    NSMutableArray *groupG =[NSMutableArray arrayWithObjects:@"谢培",@"杨洋洋",@"郝鹏达",@"时铁庄",@"郭明旺",@"谢健", nil];
    NSMutableArray *groupH = [NSMutableArray arrayWithObjects:@"马子超",@"金毛",@"李笃兴",@"美女",@"鑫鑫",@"高冷琛", nil];
    NSMutableArray *groupI = [NSMutableArray arrayWithObjects:@"白益骏",@"陈星旺",@"杜新元",@"张开宇",@"李荣建",@"李万达", nil];
    NSMutableArray *groupJ = [NSMutableArray arrayWithObjects:@"丁岩松",@"王新国",@"吕玉楠",@"钟勃",@"黄玉炎",@"吴頔", nil];
    
    self.classDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:groupA,@"A",groupB,@"B",groupC,@"C",groupD,@"D",groupE,@"E",groupF,@"F",groupG,@"G",groupH,@"H",groupI,@"I",groupJ,@"J", nil];
    NSArray *allKeys = [_classDic allKeys];
    // 将key数组排序并转化为可变的数组.
    self.allKeys = [NSMutableArray arrayWithArray:[allKeys sortedArrayUsingSelector:@selector(compare:)]];
    
}
- (void)layoutTableView{
    // 在创建TableView的时候,需要给定风格 一旦给定就不能修改
    // 创建对象
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    // 配置属性
    tableView.backgroundColor = [UIColor cyanColor];
    
    // 设置数据源
    tableView.dataSource = self;
    
    // 设置代理
    tableView.delegate = self;
    tableView.showsVerticalScrollIndicator = NO;
    
    // 设置分割线的分割线的风格
//    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // 设置分割线的颜色
    tableView.separatorColor = [UIColor redColor];
    
    // 设置行高
    tableView.rowHeight = 100;
    
    // 添加父视图
    [self.view addSubview:tableView];
    
    // 释放所有权
    [tableView release];
    
}
#pragma mark - UITableViewDataSource UITableViewDelegate
// 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // 由Key的个数决定分区数
    return _allKeys.count;
}
// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 获取对应分组
    NSString *key = _allKeys[section];
    // 获取对应分组
    NSMutableArray *group = [_classDic valueForKey:key];
    // 由对应分组元素个数决定对应分组行数
    return group.count;
}
// 设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
//    // 获取对应的key
//    NSString *key = _allKeys[indexPath.section];
//    // 获取对应分组
//    NSMutableArray *group = [_classDic valueForKey:key];
//    // 获取对应名字
//    NSString *name = group[indexPath.row];
//    // 配置cell
//    cell.textLabel.text = name;
//    cell.imageView.image = [UIImage imageNamed:@"1"];
    
//    // 使用重用机制创建cell
//    static NSString *identifier = @"aa";
//    // 先到重用队列去取 cell
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    // 判定
//    if (cell == nil) {
//        // 没有取到 就创建cell
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
//        
//    }
    // 使用重用机制创建cell
    // 重用标示符
    static NSString *identifier = @"resuse";
    // 通过标示符 到重用队列去取对应的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        // 如果为空就创建一个cell并设置重用标示符
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    // cell的赋值
    // 获取对应key
    NSString *key = _allKeys[indexPath.section];
    // 再获取对应分组
    NSArray *group = [_classDic valueForKey:key];
    // 再获取对应名字
    NSString *name = group[indexPath.row];
    // 赋值
    cell.textLabel.text = name;
    cell.imageView.image = [UIImage imageNamed:@"1"];
//    if (indexPath.row == 0) {
//       cell.textLabel.text = @"用过的";
//    }
    NSLog(@"%@",cell);
    return cell;
}

// 区头title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _allKeys[section];
}
// 区尾tittle
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"我是区尾的文字";
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
// 设置索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _allKeys;
}
// 设置区头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    label.text = @"我是一个自定义的区头";
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor greenColor];
    return label;
}
// 选中cell 触发的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld %ld",indexPath.section,indexPath.row);
    // push
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}



















//// 设置分区数
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return _allKeys.count;
//}
//
//// 行数
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    // 获取对应key
//    NSString *key = [_allKeys objectAtIndex:section];
//    NSMutableArray *group = [_classDic valueForKey:key];
//    return group.count;
//}
//
//// 设置Cell
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    // 创建Cell
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:nil];
//    
//    // 配置Cell
////    cell.textLabel.text = @"西兰花";
////    cell.detailTextLabel.text = @"空心菜";
////    cell.imageView.image = [UIImage imageNamed:@"1"];
////    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    // 获取对应的key值
//    NSString *key = [_allKeys objectAtIndex:indexPath.section];
//    // 获取对应的分组
//    NSMutableArray *group = [_classDic valueForKey:key];
//    // 获取对应的名字
//    NSString *name = [group objectAtIndex:indexPath.row];
//    // 显示
//    cell.textLabel.text = name;
//    return cell;
//}
//// 设置 分区的tittle
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:   (NSInteger)section{
//    return [_allKeys objectAtIndex:section];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
