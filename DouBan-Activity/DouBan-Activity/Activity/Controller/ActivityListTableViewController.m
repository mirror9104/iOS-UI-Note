//
//  ActivityListTableViewController.m
//  DouBan-Activity
//
//  Created by huchunyuan on 15/9/8.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ActivityListTableViewController.h"
#import "RequestHandle.h"
#import "URL.h"
#import "Activity.h"
#import "ActivityCell.h"
#import "UIImageView+WebCache.h"

@interface ActivityListTableViewController ()<RequestHandleDelegate>
@property (nonatomic,retain)RequestHandle *requestHandle;// 记录网络请求对象
@property (nonatomic,retain)NSMutableArray *activityArr;// 活动

@end

@implementation ActivityListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self requestData];
}
- (void)requestData{
    self.requestHandle = [[RequestHandle alloc] initWithUrlString:kActivityListURL parameter:nil requestMethod:@"GET" delegate:self];
}
#pragma mark -RequestHandleDelegate
/** 请求失败 */
- (void)requestHandle:(RequestHandle *)requestHandle didFailWithError:(NSError *)error{
    
}
/** 请求成功 */
- (void)requestHandle:(RequestHandle *)requestHandle didSucceedWithData:(NSData *)data{
    // 解析
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    // 数据处理
    NSArray *events = [dataDic valueForKey:@"events"];
    
    // 遍历 遍历活动数组 获取活动字典 进行对象封装
    for (NSDictionary *dic in events) {
        Activity *activity = [[Activity alloc] init];
        
        // 赋值
        [activity setValuesForKeysWithDictionary:dic];
        // 装入数组
        if (_activityArr == nil) {
            self.activityArr = [NSMutableArray array];
        }
        [_activityArr addObject:activity];
        [activity release];
    }
    // 刷新界面
    [self.tableView reloadData];

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
    return _activityArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    // 对于cell上的图片进行清空
    cell.activityPci.image = [UIImage imageNamed:@"picholder.png"];
    Activity *activity = _activityArr[indexPath.row];
    
    cell.titleLabel.text = activity.title;
    cell.timeLabel.text = activity.time;
    cell.addressLabel.text = activity.address;
    cell.categoryLabel.text = activity.category_name;
    cell.participantLabel.text = activity.participant_count;
    cell.wisherLabel.text = activity.wisher_count;
//    NSURL *imageURL = [NSURL URLWithString:activity.image];
//    cell.activityPci.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:activity.image]]];
    if (activity.picIamge == nil && activity.isLoading == NO) {
        // 进行图片的加载
        [activity loadImage];
        // 添加观察者
        [activity addObserver:self forKeyPath:@"picIamge" options:(NSKeyValueObservingOptionNew) context:[indexPath retain]];
    }else{
        cell.activityPci.image = activity.picIamge;
    }
//    NSURL *urlo = [NSURL URLWithString:activity.image];
//    [cell.imageView sd_setImageWithURL:url];
//    [cell.activityPci sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"picholder.png"]];
//    [cell.activityPci sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"picholder.png"] options:SDWebImageLowPriority];
//    self.
    return cell;
}

// 观察者 回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    // 获取新值 UIImage
    UIImage *image = [change valueForKey:@"new"];
    
    // 获取对应的CEll
    NSIndexPath *indexPath = (NSIndexPath *)context;
    
    ActivityCell *cell = (ActivityCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    
    cell.activityPci.image = image;
    [indexPath release];
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
