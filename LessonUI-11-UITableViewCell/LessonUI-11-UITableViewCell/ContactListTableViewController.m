//
//  ContactListTableViewController.m
//  LessonUI-11-UITableViewCell
//
//  Created by huchunyuan on 15/8/27.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ContactListTableViewController.h"
#import "Contact.h"
#import "MyTableViewCell.h"
#import "girlCell.h"

@interface ContactListTableViewController ()
@property (nonatomic,retain)NSMutableArray *allKeys;
@property (nonatomic,retain)NSMutableDictionary *classDic;
@end
@implementation ContactListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"通讯录";
    // 读取数据
    [self readData];
}
- (void)readData{
    // 获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    // 通过文件路径读取数据
    NSMutableDictionary *dateDic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    // 数据的处理 数据--->对象
    self.classDic = [NSMutableDictionary dictionary];
    // 遍历数据字典
    for (NSString *key in dateDic) {
        // 数据数组
        NSArray *group = [dateDic valueForKey:key];
        // 创建对象数组
        NSMutableArray *newGroup = [NSMutableArray array];
        // 把成对象的数组放入字典
        [_classDic setValue:newGroup forKey:key];
        // 遍历数据数组 找到数据小字典
        for (NSDictionary *dic in group) {
            // 创建联系人
            Contact *contact = [[Contact alloc] init];
            // 赋值
            [contact setValuesForKeysWithDictionary:dic];
            // 添加到数组
            [newGroup addObject:contact];
            [contact release];
        }
    }
    // 获取所有的key 并进行排序
    NSArray *sortArr = [[_classDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.allKeys = [NSMutableArray arrayWithArray:sortArr];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
// 通过分区数获取对应分组
- (NSMutableArray *)getGroupWithSction:(NSInteger)section{
    // 获取对应key
    NSString *key = _allKeys[section];
    // 获取对应分组
    NSMutableArray *group = [_classDic valueForKey:key];
    return group;
}
// 获取联系人
- (Contact *)getContactWith:(NSIndexPath *)indexPath{
    // 获取对应分组
    NSArray *group =[self getGroupWithSction:indexPath.section];
    // 返回对应联系人
    Contact *contact = group[indexPath.row];
    return contact;
}
// 返回区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _allKeys.count;
}
// 返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self getGroupWithSction:section] count];
}
// 设置索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _allKeys;
}
// 设置Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     // 获取对应联系人
    Contact *contact = [self getContactWith:indexPath];
    // 再通过性别判断 使用那一套cell
    if ([contact.sex isEqualToString:@"男"]) {
        // 使用重用机制创建cell
        static NSString *identifier = @"a";
        
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[MyTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:identifier];
        }
        // 给cell赋值
        cell.contact = contact;
        // 将联系人 传给 视图层
        return cell;
    }
    // 重用
    static NSString *identifier2 = @"b";
    girlCell *cell = [tableView dequeueReusableCellWithIdentifier:  identifier2];
    if (cell == nil) {
        cell = [[girlCell alloc] initWithStyle: (UITableViewCellStyleDefault) reuseIdentifier:identifier2];

    }
    cell.contact = contact;
    return cell;

}
/** 设置区头 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _allKeys[section];
}
// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 获取对应联系人
    Contact *contact = [self getContactWith:indexPath];
    // 计算描述 文字需要的高度
    CGFloat height = [MyTableViewCell heightWithString:contact.introduce];
    return 145+height > 180 ? 145+height : 180;
}

#pragma mark - 编辑
// 1让TableView处于编辑状态
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    // 让tableView 处于编辑状态
    [self.tableView setEditing:editing animated:animated];
}
// 2.设置某一行是否可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
// 3.编辑风格
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
// 4.提交删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 删除操作
        // 获取对应分组
        NSMutableArray *group = [self getGroupWithSction:indexPath.section];
        if (group.count == 1) {
            // 分区删除
            // 数据删除
            [_classDic removeObjectForKey:_allKeys[indexPath.section]];
            [_allKeys removeObjectAtIndex:indexPath.section];
            // UI界面删除
            [tableView deleteSections:[[NSIndexSet alloc] initWithIndex:indexPath.section] withRowAnimation:(UITableViewRowAnimationLeft)];
        }else{
            // 行删除
            // 数据删除
            [group removeObjectAtIndex:indexPath.row];
            // UI界面删除
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationLeft)];
        } 
    }
}
@end
