//
//  ContactListViewController.m
//  AddressBook
//
//  Created by huchunyuan on 15/8/28.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ContactListViewController.h"
#import "AddContactViewController.h"
#import "DetailViewController.h"
#import "DataHandle.h"
#import "Contact.h"

@interface ContactListViewController ()

@end

@implementation ContactListViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 刷新界面
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 自定义 NavigationItem
    [self customizeNavigationItem];
    // 调用单例类
    [DataHandle shareDateHandle];
}
/** 自定义navigationItem */
- (void)customizeNavigationItem{
    // 设置tittle
    self.navigationItem.title = @"BJS150724通讯录";
    // 设置编辑item
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    // 设置leftBarButtonItem
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(addContactAction:)];
}
/** 跳转添加按钮 */
- (void)addContactAction:(UIBarButtonItem *)item{
    // 创建视图
    AddContactViewController *addVC = [[[AddContactViewController alloc] init] autorelease];
    UINavigationController *Navi = [[[UINavigationController alloc] initWithRootViewController:addVC] autorelease];
    // 过度样式
    Navi.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    // 模态
    [self presentViewController:Navi animated:YES completion:nil];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [DataHandle shareDateHandle].allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSArray *arr = [[DataHandle shareDateHandle].classDic valueForKey:[DataHandle shareDateHandle].allKeys[section]] ;
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:nil] autorelease];
    cell.textLabel.text = @"跳转到详情";
    // 获取对应 key
    NSString *key = [DataHandle shareDateHandle].allKeys[indexPath.section];
    // 获取对应分组
    NSArray *group = [[DataHandle shareDateHandle].classDic valueForKey:key];
    // 获取对应联系人
    Contact *contact = group[indexPath.row];
    // cell赋值
    cell.textLabel.text = contact.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailVC = [[[DetailViewController alloc] init] autorelease];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [DataHandle shareDateHandle].allKeys[section];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
