//
//  RootViewController.m
//  LessonUI-05-Target_Action
//
//  Created by huchunyuan on 15/8/19.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "TouchView.h"

@interface RootViewController ()
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    [touchview1 addTarget:self action:@selector(changeColor:)];
    [touchView2 addTarget:self action:@selector(changePosition:)];
    [touchView3 addTarget:self action:@selector(changeSize:)];
    
}
- (void)changeSize:(TouchView *)touchView{
    touchView.frame = CGRectMake(arc4random()%100, arc4random()%(500-300)+300, 275, 100);
}
- (void)changePosition:(TouchView *)touchView{
    touchView.bounds = CGRectMake(0, 0, arc4random()%(200-100)+100, arc4random()%(200-100)+100);
}
- (void)changeColor:(TouchView *)touchView{
    touchView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
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
