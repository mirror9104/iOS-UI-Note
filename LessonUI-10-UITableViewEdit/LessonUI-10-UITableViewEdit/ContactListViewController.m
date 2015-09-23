//
//  ContactListViewController.m
//  LessonUI-10-UITableViewEdit
//
//  Created by huchunyuan on 15/8/26.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ContactListViewController.h"
#import "Contact.h"
#import "DetailViewController.h"

@interface ContactListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSMutableArray *allKeys;
@property (nonatomic,retain)NSMutableDictionary *classDic;
@property (nonatomic,retain)UITableView *tableView;
@property (nonatomic,retain)NSMutableArray *deleteArr;// 用来记录选中的要删除的联系人

@end
@implementation ContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.title = @"BJS50724花名册";
    // 读取数据
    [self readDate];
    //tableView 布局
    [self layoutTableView];
    // 编辑按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}
// 1.设置是否 可以编辑
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    // 设置tableView是否 可编辑
    [_tableView setEditing:editing animated:animated];
    // 当进入编辑状态 创建删除数组
    if (editing) {
        self.deleteArr = [NSMutableArray array];
        
    }else{
        // 将黑名单中的联系人删除
        for (Contact *contact in _deleteArr) {
            for (int i = 0; i < _allKeys.count; i++) {
                // 获取对应的key
                NSString *key = _allKeys[i];
                // 获取对应分组
                NSMutableArray *group = [_classDic valueForKey:key];
                // 删除对应的联系人
                [group removeObject:contact];
                // 如果分组为空 就删除分组
                if (group.count == 0) {
                    [_classDic removeObjectForKey:key];
                    [_allKeys removeObject:key];
                }
            }
        }
        // 让tableView重读数组
        [self.tableView reloadData];
        
    }
}
#pragma mark - 编辑操作
// 删除
// 2.设置某一行 是否可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
// 3.设置编辑风格
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 3种风格 添加删除没
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}
// 4.提交编辑操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    // 删除数据
    // 获取对应的key
    NSString *key = _allKeys[indexPath.section];
    // 获取对应的分组
    NSMutableArray *group = [_classDic valueForKey:key];
    // 删除对应的联系人
    if (group.count == 1) {
        // 删除分组
        [_classDic removeObjectForKey:key];
        [_allKeys removeObject:key];
        // 删除分区
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:indexPath.section];
        [tableView deleteSections:set withRowAnimation:UITableViewRowAnimationRight];
    }else{
        
    [group removeObjectAtIndex:indexPath.row];
    // UI界面的删除 
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}
// 读取数据
- (void)readDate{
    // 获取文件路径ClassContact.plist文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ClassContact" ofType:@"plist"];
    // 通过文件路径读取数据
    NSDictionary *dateDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    // 将数据处理 进行对象封装
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
            // 使用kvc赋值
            [contact setValuesForKeysWithDictionary:dic];
            // 将对象装入数组
            [group addObject:contact];
            [contact release];
        }
    }
    NSLog(@"%@",_classDic);
    // 获取所有的Key 并排序
    NSArray *sortArr = [[_classDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.allKeys = [NSMutableArray arrayWithArray:sortArr];
}
// tableView 布局
- (void)layoutTableView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    // 设置数据源代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // 添加父视图
    [self.view addSubview:_tableView];
}

#pragma mark - 移动
// 第一步编辑状态上面已经实现过
// 2.设置某一行是否可以进行移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
// 3.设置 是否可以跨区域
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    // 通过分区 判定
    if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
        // 如果在同一个分区 就返回目标位置
        return proposedDestinationIndexPath;
    }
    // 如果不在一个分区 返回原来的位置
    return sourceIndexPath;
}
// 4.提交移动操作
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    // 获取对应key
    NSString *key = _allKeys[sourceIndexPath.section];
    // 获取对应分组
    NSMutableArray *group = [_classDic valueForKey:key];
    // 获取对应联系人
    Contact *contact = [group[sourceIndexPath.row] retain];
    [group removeObjectAtIndex:sourceIndexPath.row];
    // 再插入目标位置 (单个)
    [group insertObject:contact atIndex:destinationIndexPath.row];
    [contact release];
}
#pragma mark - delegate,dateSource
// 对应的分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _allKeys.count;
}
// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 获取对应的key
    NSString *key = _allKeys[section];
    // 获取对应分组
    NSMutableArray *group = [_classDic valueForKey:key];
    return group.count;
}
// 设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 重用标示符
    static NSString *identifier = @"aa";
    // 重用队列区出cell
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    // 判断cell是否为空
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    // 展示数据
    NSString *key = _allKeys[indexPath.section];
    // 获取对应分组
    NSMutableArray *group = [_classDic valueForKey:key];
    // 获取联系人
    Contact *contact = group[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:contact.picName];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phoneNumber;
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _allKeys[section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
// 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 获取对应的key
    NSString *key = _allKeys[indexPath.section];
    // 获取对应的分组
    NSMutableArray *group = [_classDic valueForKey:key];
    // 获取对应联系人
    Contact *contact = group[indexPath.row];
    // 将联系人 放入黑名单
    [_deleteArr addObject:contact];
}
// 取消选中cell
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 获取对应的key
    NSString *key = _allKeys[indexPath.section];
    // 获取对应的分组
    NSMutableArray *group = [_classDic valueForKey:key];
    // 获取对应联系人
    Contact *contact = group[indexPath.row];
    // 取消选中时移除黑名单
    [_deleteArr removeObject:contact];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*qw
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
