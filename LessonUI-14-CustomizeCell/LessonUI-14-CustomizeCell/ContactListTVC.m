//
//  ContactListTVC.m
//  LessonUI-14-CustomizeCell
//
//  Created by huchunyuan on 15/8/31.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ContactListTVC.h"
#import "DataHandle.h"
#import "MyCell.h"

@interface ContactListTVC ()

@end

@implementation ContactListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"联系人列表";
    // 读取数据
    [DataHandle shareDateHandle];
    // 重用不够用创建一个
    // nib文件只能注册,原理和tableView dequeue重用机制差不多
    // 注册 申请 注册cell 提供足够的cell
    [self.tableView registerNib:[UINib nibWithNibName:@"MyCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"aa"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// 获取对应分组
- (NSMutableArray *)getGroupWithSeciton:(NSInteger)section{
    // 获取对应key
    NSString *key = [DataHandle shareDateHandle].allKeys[section];
    // 获取对应分组
    NSMutableArray *group = [[DataHandle shareDateHandle].classDic valueForKey:key];
    return group;
}
// 获取对应联系人
- (Contact *)getContactWithIndexPath:(NSIndexPath *)indexPath{
    // 获取对应分组
    NSMutableArray *group = [self getGroupWithSeciton:indexPath.section];
    // 获取对应联系人
    Contact *contact = group[indexPath.row];
    return contact;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [DataHandle shareDateHandle].allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *group = [self getGroupWithSeciton:section];
    return group.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 注册后拿取
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aa" forIndexPath:indexPath];
    // 赋值
    // 获取
    Contact *contact = [self getContactWithIndexPath:indexPath];
    cell.picView.image = [UIImage imageNamed:contact.picName];
    cell.nameLabel.text = contact.name;
    cell.phoneLabel.text = contact.phoneNumber;
    return cell;
    

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
