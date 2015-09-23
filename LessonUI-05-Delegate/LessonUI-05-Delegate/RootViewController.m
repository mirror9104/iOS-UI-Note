//
//  RootViewController.m
//  LessonUI-05-Delegate
//
//  Created by huchunyuan on 15/8/19.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "TouchView.h"

@interface RootViewController ()<TouchViewDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建三个视图
    TouchView *touchview1 = [[[TouchView alloc] initWithFrame:CGRectMake(50, 100, 275, 100)] autorelease];
    touchview1.backgroundColor = [UIColor redColor];
    [self.view addSubview:touchview1];
    [touchview1 release];
    
    TouchView *touchView2 = [[TouchView alloc] initWithFrame:CGRectMake(50, 250, 270, 100)];
    touchView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:touchView2];
    [touchView2 release];
    
    TouchView *touchView3 = [[TouchView alloc] initWithFrame:CGRectMake(50, 400, 275, 100)];
    touchView3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:touchView3];
    [touchView3 release];
    // 设置代理
    touchview1.delegate = self;
    touchView2.delegate = self;
    touchView3.delegate = self;
    // 设置tag值
    touchview1.tag = 100;
    touchView2.tag = 101;
    touchView3.tag = 102;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 实现方法
- (void)touchViewDidTouchBegan:(TouchView *)touchView{
    if (touchView.tag == 100) {
        [self changeColor:touchView];
        
    }else if (touchView.tag == 101) {
        [self changePosition:touchView];
        NSLog(@"位置");
    }else if (touchView.tag == 102) {
        [self changeSize:touchView];
        NSLog(@"大小");
    }
}
- (void)changeColor:(TouchView *)touchView{
    touchView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
}
- (void)changePosition:(TouchView *)touchView{
    touchView.frame = CGRectMake(arc4random()%(100-20)+20, arc4random()%(400-100)+100, 270, 100);
}
- (void)changeSize:(TouchView *)touchView{
    touchView.bounds = CGRectMake(0, 0, arc4random()%(400-150)+150, arc4random()%(200-100)+100);
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
