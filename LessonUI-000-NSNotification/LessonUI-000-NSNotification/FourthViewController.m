//
//  FourthViewController.m
//  LessonUI-000-NSNotification
//
//  Created by huchunyuan on 15/9/17.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeSystem];
    bt.frame = CGRectMake(180,64, 100, 50);
    bt.backgroundColor = [UIColor yellowColor];
    [bt setTitle:@"切换颜色" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(ChangeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];

    // 发布通知
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"什么时候改变颜色?" object:nil userInfo:@{@"color":self.view.backgroundColor}];
   
}

- (void)ChangeColor:(UIButton *)bt{
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%256/255.0) green:(arc4random()%256/255.0) blue:(arc4random()%256/255.0) alpha:1];
      [[NSNotificationCenter defaultCenter]postNotificationName:@"什么时候改变颜色?" object:nil userInfo:@{@"color":self.view.backgroundColor}];
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
