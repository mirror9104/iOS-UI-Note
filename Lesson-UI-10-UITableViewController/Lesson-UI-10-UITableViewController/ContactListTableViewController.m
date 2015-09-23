//
//  ContactListTableViewController.m
//  Lesson-UI-10-UITableViewController
//
//  Created by huchunyuan on 15/8/26.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ContactListTableViewController.h"
#import "Contact.h"

@interface ContactListTableViewController ()
@property (nonatomic,retain)NSMutableDictionary *classDic;
@property (nonatomic,retain)NSMutableArray *allKeys;
@end

@implementation ContactListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self readDate];
}
// 读取数据
- (void)readDate{
    // 获取文件路径ClassContact.plist文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ClassContact" ofType:@"plist"];
    // 通过文件路径读取数据
    NSDictionary *dateDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    // 将数据处理进行对象封装
    // 创建承装对象的字典
    self.classDic = [NSMutableDictionary dictionary];
    // 遍历 数据字典
    for (NSString *key in dateDic) {
        // 找到对应的数据分组
        NSArray *dateGroup = [dateDic valueForKey:key];
        // 创建对象数组
        NSMutableArray *group = [NSMutableArray array];
        // 将对象数组放入字典中
        [_classDic setValue:group forKey:key];
        
        // 遍历数据分组
        for (NSDictionary *dic in dateGroup) {
            // 将小字典封装对象
            Contact *contact = [[Contact alloc] init];
            // 使用KVC赋值
            [contact setValuesForKeysWithDictionary:dic];
            // 将对象装入数组
            [group addObject:contact];
            [contact release];
        }
    }
    // 获取所有的Key,并排序
    NSArray *sortArr = [[_classDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.allKeys = [NSMutableArray arrayWithArray:sortArr];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
// 设置区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _allKeys.count;
}
// 设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *group = [_classDic valueForKey:_allKeys[section]];
    return group.count;
}
// 设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 提取联系人
    NSMutableArray *group = [_classDic valueForKey:_allKeys[indexPath.section]];
    Contact *contact = group[indexPath.row];
    // 重用CELL
    static NSString *identifier = @"a";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:identifier];
    }
    // 赋值
    cell.textLabel.text = contact.name;
    cell.imageView.image = [UIImage imageNamed:contact.picName];
    cell.detailTextLabel.text = contact.phoneNumber;
    return cell;
}
// 设置区头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _allKeys[section];
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _allKeys;
}


// Override to support conditional editing of the table view.
// 每一行都可以编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
// 提交编辑操作
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 删除操作
        // 获取数组 对应分组的KEY
        NSString *key = _allKeys[indexPath.section];
        NSMutableArray *group = [_classDic valueForKey:key];
        if (group.count == 1) {
            // 当数组元素为1时删除数组和分组
            // 删除分组
            [_classDic removeObjectForKey:key];
            [_allKeys removeObject:key];
            // 删除分区
            NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:indexPath.section];
            [tableView deleteSections:set withRowAnimation:(UITableViewRowAnimationBottom)];
        }else{
            [group removeObjectAtIndex:indexPath.row];
            // Delete the row from the data source
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// 设置可以移动
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
// 是否可以跨区域
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    // 通过分区 判定
    if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
        return proposedDestinationIndexPath;
    }
    // 如果不在一个分区 返回原来的位置
    return sourceIndexPath;
}

// 4.提交移动操作
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    // 获取对应key
    NSString *key = _allKeys[fromIndexPath.section];
    // 获取对应分组
    NSMutableArray *group = [_classDic valueForKey:key];
    // 获取对应联系人
    Contact *contact = [group[fromIndexPath.row] retain];
    [group removeObjectAtIndex:fromIndexPath.row];
    // 再插入目标位置(单个)
    [group insertObject:contact atIndex:toIndexPath.row];
    [contact release];
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
