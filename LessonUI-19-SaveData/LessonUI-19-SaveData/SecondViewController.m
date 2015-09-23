//
//  SecondViewController.m
//  LessonUI-19-SaveData
//
//  Created by huchunyuan on 15/9/9.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "SecondViewController.h"
#import "Student.h"

@interface SecondViewController ()
@property (retain, nonatomic) IBOutlet UITextField *nameTF;
@property (retain, nonatomic) IBOutlet UITextField *sexTF;
@property (retain, nonatomic) IBOutlet UITextField *ageTF;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)archiveAction:(id)sender {
    // 创建学生对象
    Student *stu = [[Student alloc] init];
    stu.name = _nameTF.text;
    stu.sex = _sexTF.text;
    stu.age = _ageTF.text;
    
    // 归档操作
    // 1.创建可变data
    NSMutableData *muData = [NSMutableData data];
    // 2.创建归档对象
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:muData];
    // 3.归档
    [archiver encodeObject:stu forKey:@"JingJing"];
    // 4.归档完成
    [archiver finishEncoding];
    
    // 本地持久化
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    // 拼接
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"Student.data"];
    
    // 写入
    [muData writeToFile:filePath atomically:YES];
    [stu release];
    [archiver release];
    // 将iamge转化为data进行归档
//   NSData *UIImagePNGRepresentation(UIImage *image);                               // return image as PNG. May return nil if image has no CGImageRef or invalid bitmap format
//   NSData *UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality);  // return image as JPEG. May return nil if image has no CGImageRef or invalid bitmap format. compression is 0(most)..1(least)
    
}
- (IBAction)unArchiveAction:(id)sender {
    // 获取documents文件路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    // 拼接
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"Student.data"];
    
    // 反归档
    // 1.获取可变Mudata
    NSMutableData *muData = [NSMutableData dataWithContentsOfFile:filePath];
    
    // 2.创建归档对象
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:muData];
    // 3.犯归档
    Student *stu = [unarchiver decodeObjectForKey:@"JingJing"];
    // 4.结束反归档
    [unarchiver finishDecoding];
    _nameTF.text = stu.name;
    _sexTF.text = stu.sex;
    _ageTF.text = stu.age;
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_nameTF release];
    [_sexTF release];
    [_ageTF release];
    [super dealloc];
}
@end
