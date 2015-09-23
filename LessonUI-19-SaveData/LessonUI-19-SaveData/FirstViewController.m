//
//  FirstViewController.m
//  LessonUI-19-SaveData
//
//  Created by huchunyuan on 15/9/9.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (retain, nonatomic) IBOutlet UITextField *TF1;
@property (retain, nonatomic) IBOutlet UITextField *TF2;

@end

@implementation FirstViewController

// 写入
- (IBAction)writeAction:(id)sender {
    // 获取documents文件路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    // 获取字符串
    NSString *str1 = _TF1.text;
    NSString *str2 = _TF2.text;
#pragma mark - 字符串

//    // 拼接文件路径
//    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"test.TXT"];
//    // stringByAppendingString 如果是string不会自动带/ 需要自己写
////    NSString *filePath2 = [documentsPath stringByAppendingString:@"/test.TXT"];
//    // 写入
//    [str1 writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];

    
#pragma mark - 数组
//    // 创建数组
//    NSArray *arr = @[str1,str2];
//    
//    // 拼接文件路径
//    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"arr.plist"];
//    
//    // 写入
//    [arr writeToFile:filePath atomically:YES];
    
#pragma mark -字典
//    // 创建字典
//    NSDictionary *dic = @{@"tf1":str1,@"tf2":str2};
//    // 拼接文件路径
//    NSString *filePath = [documentsPath stringByAppendingString:@"dic.TXT"];
//    // 写入
//    [dic writeToFile:filePath atomically:YES];
#pragma mark - data写入
    NSData *data = [str1 dataUsingEncoding:NSUTF8StringEncoding];
    // 文件拼接
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"data.TXT"];
    // 写入
    [data writeToFile:filePath atomically:YES];
}

// 读取
- (IBAction)readAction:(id)sender {
    // 获取documents文件路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
#pragma mark -字符串读取
//    // 拼接文件路径
//    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"test.TXT"];
//    self.TF2.text = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
#pragma mark -数组读取
//    // 拼接路径
//    NSString *filePathArr = [documentsPath stringByAppendingPathComponent:@"arr.plist"];
//    // 获取数组
//    NSArray *arr = [NSArray arrayWithContentsOfFile:filePathArr];
//    // 赋值
//    self.TF1.text = arr[0];
//    self.TF2.text = arr[1];
#pragma mark -字典读取
//    // 拼接路径
//    NSString *filePathDic = [documentsPath stringByAppendingString:@"dic.TXT"];
//    // 读取
//    NSDictionary *dic  = [NSDictionary dictionaryWithContentsOfFile:filePathDic];
//    // 展示
//    _TF1.text = [dic valueForKey:@"tf1"];
//    _TF2.text = [dic valueForKey:@"tf2"];

#pragma mark -data读取
    // 文件路径拼接
    NSString *filePathData = [documentsPath stringByAppendingPathComponent:@"data.TXT"];
    // 读取
    NSData *data = [NSData dataWithContentsOfFile:filePathData];
    
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    _TF1.text = str;

}
//创建
- (IBAction)creatAction:(id)sender {
    
    // 获取documents 文件路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    // 拼接文件夹路径
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"Images"];
    
    // 常见文件管理对象
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 创建
    [manager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    
}

// 移动
- (IBAction)moveAction:(id)sender {
    // 将Image移动到Caches中
    
    // oldPath老路径
    // 获取temp的Image路径
    NSString *tempPath = NSTemporaryDirectory();
    // 拼接
    NSString *oldPAth = [tempPath stringByAppendingPathComponent:@"Images"];
    
    // newPath
    // 获取Caches
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //拼接
    NSString *newPath = [cachesPath stringByAppendingPathComponent:@"Images"];
    
    // 创建文件管理对象
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 移动
    [manager moveItemAtPath:oldPAth toPath:newPath error:nil];
    
    
    
}

// 复制
- (IBAction)copyAction:(id)sender {
    // 1.获取tmp文件路径
    NSString *tmp = NSTemporaryDirectory();
    
    // 2.文件拼接
    NSString *newPath = [tmp stringByAppendingPathComponent:@"Images"];
    
    // 创建文件管理对象
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 获取documents文件路径
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    // 拼接
    NSString *oldPath = [documents stringByAppendingPathComponent:@"Images"];
    
    //复制
    [manager copyItemAtPath:oldPath toPath:newPath error:nil];
}

// 删除
- (IBAction)removeAction:(id)sender {
    // 获取路径
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    // 拼接
    NSString *filePath = [cachesPath stringByAppendingPathComponent:@"Images"];
    
    // 创建文件管理对象
    NSFileManager *manager = [NSFileManager defaultManager];
    
    [manager removeItemAtPath:filePath error:nil];

}

// 是否存在
- (IBAction)existAction:(id)sender {
    
    // 获取Caches文件路径
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    // 拼接
    NSString *filePath = [caches stringByAppendingPathComponent:@"Images"];
    
    // 创建管理对象
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 判断是否存在
    BOOL isExsist = [manager fileExistsAtPath:filePath];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    if (isExsist) {
        alertView.message = @"文件存在";
    }else{
        alertView.message = @"文件不存在";
    }
    [alertView show];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)dealloc {
    [_TF1 release];
    [_TF2 release];
    [super dealloc];
}
@end
