//
//  ViewController.m
//  RequestHandle
//
//  Created by huchunyuan on 15/9/7.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ViewController.h"
#import "RequestHandle.h"

@interface ViewController ()<RequestHandleDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 
 活动: http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php
 
 电影:  http://project.lanou3g.com/teacher/yihuiyun/lanouproject/movielist.php
 
 影院: http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchcinema.php?cinemaId=141
 
 */
// 活动
- (IBAction)request1:(id)sender {
    RequestHandle *request =[[RequestHandle alloc] initWithUrlString:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php" parameter:nil requestMethod:@"GET" delegate:self];
    [request cancleRequest];
    

}
// 电影
- (IBAction)request2:(id)sender {
    [[RequestHandle alloc] initWithUrlString:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/movielist.php" parameter:nil requestMethod:@"GET" delegate:self];
    
}
// 影院
- (IBAction)request3:(id)sender {
    [[RequestHandle alloc] initWithUrlString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx" parameter:@"date=20150904&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213" requestMethod:@"POST" delegate:self];
}

#pragma mark - RequestHandleDelegate
// 请求成功
- (void)requestHandle:(RequestHandle *)requestHandle didSucceedWithData:(NSData *)data{
    // 解析data
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"%@",dic);
}
// 请求失败
- (void)requestHandle:(RequestHandle *)requestHandle didFailWithError:(NSError *)error{
    
    NSLog(@"%@",error);
    
}
@end
