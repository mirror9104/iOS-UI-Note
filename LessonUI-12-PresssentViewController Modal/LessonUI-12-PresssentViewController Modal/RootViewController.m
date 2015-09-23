//
//  RootViewController.m
//  LessonUI-12-PresssentViewController Modal
//
//  Created by huchunyuan on 15/8/28.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "PushViewController.h"
#import "ModalViewController.h"


@interface RootViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 自定义NavigationItem
    [self customizeNavigationItem];
    // 定义imageView
    [self lauoutImageView];
}
- (void)lauoutImageView{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 355, 500)];
    _imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imageView];
    [_imageView release];
    // 添加轻拍手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [_imageView addGestureRecognizer:tap];
    [tap release];
    // 打开用户交互
    _imageView.userInteractionEnabled = YES;
}
// 轻拍事件
- (void)tapAction:(UITapGestureRecognizer *)tap{
    // 创建相册 视图控制器
    UIImagePickerController *picker = [[[UIImagePickerController alloc] init] autorelease];
    picker.delegate = self;
    // 模态
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)customizeNavigationItem{
    // tittle
    self.navigationItem.title = @"ROOT";
    // leftBarbuttonItem  pushAction
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"PUSH" style:(UIBarButtonItemStyleDone) target:self action:@selector(pushAction)];
    // rightBarButtonItem modalAction
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Modal" style:(UIBarButtonItemStyleDone) target:self action:@selector(modalAction)];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)modalAction{
    // 创建莫泰视图控制器对象
    ModalViewController *modalVC = [[ModalViewController alloc] init];
    // 创建导航控制器 管理模态视图控制器
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:modalVC];
    // 设置过度效果
    naVC.modalTransitionStyle= UIModalTransitionStyleFlipHorizontal;
    // UIModalTransitionStyleCoverVertical 默认 上升
    // UIModalTransitionStyleFlipHorizontal 旋转效果
    // UIModalTransitionStyleCrossDissolve; 渐变效果
    // UIModalTransitionStylePartialCurl 翻页效果
    
    // 另一种效果 在手机中 效果很小
//    naVC.modalPresentationStyle =UIModalPresentationFormSheet;
    
    // 模态
    [self.navigationController presentViewController:naVC animated:YES completion:^{
        NSLog(@"模态了");
    }];
}
- (void)pushAction{
    PushViewController *pushVC = [[PushViewController alloc] init];
  
    [self.navigationController pushViewController:pushVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/** 选中图片时触发 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"选中图片,获取Info%@",info);
    // 获取图片 UIImagePickerControllerOriginalImage
    UIImage *image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    [SingoleClass shareSingleClass].image = image;
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 点击cancel时触发
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"点击cancel");
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
