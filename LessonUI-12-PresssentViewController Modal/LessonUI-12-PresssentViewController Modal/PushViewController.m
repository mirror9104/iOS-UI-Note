//
//  PushViewController.m
//  LessonUI-12-PresssentViewController Modal
//
//  Created by huchunyuan on 15/8/28.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "PushViewController.h"
#import "SingoleClass.h"
#import "secondViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"PUSH";
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 355, 500)];
    imageView.backgroundColor = [UIColor blackColor];
    ;
    imageView.image = [SingoleClass shareSingleClass].image;
    [self.view addSubview:imageView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"PUSH" style:(UIBarButtonItemStyleDone) target:self action:@selector(PUSHAction)];
}
- (void)PUSHAction{
    secondViewController *secondVC = [[secondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
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
