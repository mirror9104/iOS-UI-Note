//
//  ViewController.m
//  LessonUI-16-JSONParser
//
//  Created by huchunyuan on 15/9/5.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"
#import "Student.h"

@interface ViewController ()

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
 对于JSON数据解析 我们有很多第三方工具 比如SBJSON 我们一般使用JSONKit 它是通过给NSString,NSData 添加分类的方式进行解析 在效率上仅次于系统提供的JSON解析
 */
// 第三方控件JSONKit解析
- (IBAction)JSONKitClick:(id)sender {
    // 1.获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Student" ofType:@"json"];
    // 2.读取文件内容
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    // 3解析
    NSArray *arr = [data objectFromJSONData];
//    NSLog(@"%@",arr);
    
    NSMutableArray *stus = [NSMutableArray array];
    // 对象封装
    for (NSDictionary *dic in arr) {
        // 创建对象
        Student *stu = [[Student alloc] init];
        [stu setValuesForKeysWithDictionary:dic];
        [stus addObject:stu];
        [stu release];
    }
    NSLog(@"%@",stus);
}
// 系统自带解析
- (IBAction)SystemClick:(id)sender {
//    // 1.获取文件路径
//    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"Student" ofType:@"json"];
//    // 2.读取数据
//    NSData *data = [NSData dataWithContentsOfFile:filePath];
//    // 3.解析
//    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//    NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"大众点评数据" ofType:@"json"];
//    NSData *data2 = [NSData dataWithContentsOfFile:filePath2];
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data2 options:0 error:nil];
//    NSLog(@"%@",dic);
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"大众点评数据" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    // options
//    NSJSONReadingMutableContainers = (1UL << 0),
//    NSJSONReadingMutableLeaves = (1UL << 1),
//    NSJSONReadingAllowFragments = (1UL << 2)
//    
//    第一个是可变字典 或者 数组
//    第二个是可变字符串
//    第三个是所有的都是不可变的
    NSArray *busin = [dic valueForKey:@"businesses"];
    NSDictionary *cateArr = [busin firstObject];
    NSArray *categories = [cateArr valueForKey:@"categories"];
    NSLog(@"%@",categories[0]);
}



@end
