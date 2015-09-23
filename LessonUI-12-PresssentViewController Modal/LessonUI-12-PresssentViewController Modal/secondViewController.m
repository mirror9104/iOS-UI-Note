//
//  secondViewController.m
//  LessonUI-12-PresssentViewController Modal
//
//  Created by huchunyuan on 15/8/28.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "secondViewController.h"
#import "SingoleClass.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 355, 500)];
    imageView.backgroundColor = [UIColor blackColor];
    imageView.image = [SingoleClass shareSingleClass].image;
    [self.view addSubview:imageView];
    [imageView release];
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

@end
