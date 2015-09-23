//
//  FirstViewController.m
//  LessonUI-08-PassValue(Navigation)
//
//  Created by huchunyuan on 15/8/24.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()<SendDelegate>
@property (nonatomic,retain)UITextField *tf;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 自定义navigationItem
    [self customizeNavigationItem];
    // 布局tf
    [self layouttf];
    
}

// 布局tf
- (void)layouttf{
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 275, 50)];
    // 圆角
    _tf.borderStyle = UITextBorderStyleRoundedRect;
    _tf.placeholder = @"请任意输入";
    [self.view addSubview:_tf];
    [_tf release];
}

- (void)customizeNavigationItem{
    // 设置title
    self.navigationItem.title = @"FirstVC";
    
    // 1.创建button
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeSystem];
    [bt setTitle:@"下一页" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    bt.frame = CGRectMake(0, 0, 80, 44);
    
    // 2.通过button创建rightItem
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:bt];
    
    // 3.给rightBarButtonITem赋值
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
    
}
- (void)StringToFirst:(NSString *)str{
    _tf.text = str;
}
#pragma mark - 事件

- (void)pushAction:(UIButton *)bt{
    SecondViewController *secondVC = [[[SecondViewController alloc] init] autorelease];
    secondVC.delegate = self;
    [self.navigationController pushViewController:secondVC animated:YES];
    secondVC.tfStr = _tf.text;
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

@end
