//
//  ContactListTableViewController.m
//  LessonUI-15-StoryBoard
//
//  Created by huchunyuan on 15/9/4.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ContactListTableViewController.h"
#import "MyCell.h"
#import "DetailViewController.h"
#import "MBProgressHUD+MJ.h"
@interface ContactListTableViewController ()
@property (nonatomic,retain)DetailViewController *detailVC;// 详情界面控制器
@end

@implementation ContactListTableViewController
- (IBAction)pushAction:(id)sender {
    [self performSegueWithIdentifier:@"push" sender:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 取消自己每个Cell的线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 不需要注册,不需要判断取空,StroyBoard自动创建和重用
    // 需要在stroyBoard里的cell的identifire写上值
    
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aa" forIndexPath:indexPath];
    cell.nameLabel.text = @"西兰花";
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

// 点击Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [MBProgressHUD showSuccess:@"跳转成功"];
    // 获取对应的cell
    MyCell *cell = (MyCell *)[tableView cellForRowAtIndexPath:indexPath];
    _detailVC.nameLabel.text = cell.nameLabel.text;
    _detailVC.sexLabel.text = cell.sexLabel.text;
    _detailVC.phoneLabel.text = cell.phoneLabel.text;
    _detailVC.picView.image = cell.picView.image;
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    // sourceViewController原控制器
    // destinationViewController目的控制器
    // 获取目标(push)的controller
    self.detailVC = [segue destinationViewController];
    // 视图控制器的创建 和 他自带view不一定同时存在
    // 只有当试图控制器的view被使用时 才会被创建(调用loadView,调用viewDidLoad)
    // 在没有使用到view的时候,view是不存在的,那么view的子视图更是没有创建
    _detailVC.view = _detailVC.view;
//    _detailVC.view.backgroundColor = [UIColor orangeColor];
//    _detailVC.nameLabel.text =
    
}


@end
