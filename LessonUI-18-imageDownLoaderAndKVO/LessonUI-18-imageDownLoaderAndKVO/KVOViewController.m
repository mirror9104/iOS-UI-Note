//
//  KVOViewController.m
//  LessonUI-18-imageDownLoaderAndKVO
//
//  Created by huchunyuan on 15/9/8.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "KVOViewController.h"
#import "Person.h"

@interface KVOViewController ()
@property (retain, nonatomic) IBOutlet UITextField *nameTF;
@property (nonatomic,retain)Person *person;
@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.person  = [[Person alloc] init];
    // 观察者  addObserver 一般把当前controller当做观察者
    // forKeyPath
    // options 观察新值 NSKeyValueObservingOptionNew
    // context 预留参数
    
    // 给person对象添加观察者
    [self.person addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:@"西兰花"];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"keyPath:%@",keyPath);
    NSLog(@"object:%@",object);
    NSLog(@"change:%@",change);
    NSLog(@"context:%@",context);
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // 取消当前属性回收键盘
//    [self.nameTF resignFirstResponder];
    // 当前view结束编辑
    [self.view endEditing:YES];
    
    // 使用输入框内的名字给person对象赋值
    self.person.name = self.nameTF.text;
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
    [super dealloc];
}
@end
