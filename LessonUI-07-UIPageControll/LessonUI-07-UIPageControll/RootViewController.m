//
//  RootViewController.m
//  LessonUI-07-UIPageControll
//
//  Created by huchunyuan on 15/8/21.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UIScrollViewDelegate>
@property (nonatomic,retain)UIPageControl *pageControl;
@property (nonatomic,retain)UIScrollView *scrollView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    if ([user boolForKey:@"First"]) {
//        // 已经不是第一次运行
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你已经不是第一次了" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//        [alertView show];
//        [alertView release];
//    }else{
        // 第一次运行
        // 布局ScrollView
        [self layoutScrollView];
        
        // 布局ImageViews
        [self layoutImageViews];
        // 布局PageControl
        [self layoutPageControl];
        // 使用user标记第一次运行
        [user setBool:YES forKey:@"First"];
//    }
//    NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]);
}
// 布局imageViews
- (void)layoutImageViews{
    // 循环创建imageView 并添加到scrollView上
    for (int i = 0; i < 6; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(375*i, 0, 375, 667)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"v6_guide_%d.png",i+1]];
        // 添加父视图
        [_scrollView addSubview:imageView];
        [imageView release];
        if (i == 5) {
            imageView.userInteractionEnabled = YES;
            // 将手势添加到最后一个imageView上
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [imageView addGestureRecognizer:tap];
            [tap release];
        }
    }
}
// 布局ScrollView
- (void)layoutScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    // 显示内容的大小
    _scrollView.contentSize = CGSizeMake(375*6, 667);
    // 取出水平滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    // 设置整屏滑动
    _scrollView.pagingEnabled = YES;
    // 设置代理
    _scrollView.delegate = self;
    // 添加父视图
    [self.view addSubview:_scrollView];
    // 释放所有权
    [_scrollView release];
    
    
}
// 布局PAgeControl
- (void)layoutPageControl{
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 275, 30)];
    // 配置属性
    _pageControl.center = CGPointMake(375/2, 667-100);
    // 设置点的个数
    _pageControl.numberOfPages = 6;
    // 设置当前点的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    // 设置其他点的颜色
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    // 设置当前点的位置
    _pageControl.currentPage = 0;
    // 为PageConrol添加点击事件
    [_pageControl addTarget:self action:@selector(pageConrolAction:) forControlEvents:UIControlEventValueChanged];
    // 添加父视图
    [self.view addSubview:_pageControl];
    // 释放所有权
    [_pageControl release];
}
- (void)tapAction:(UITapGestureRecognizer *)tap{
    UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"欢迎使用" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
    [alerView show];
    [alerView release];
    [self.scrollView removeFromSuperview];
    [self.pageControl removeFromSuperview];
}
// page方法
- (void)pageConrolAction:(UIPageControl *)pageControl{
    // 设置scrollView的偏移量
    _scrollView.contentOffset = CGPointMake(375*pageControl.currentPage, 0);
    NSLog(@"%ld",pageControl.currentPage);
    
}
// 将要减速
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//    _pageControl.currentPage = scrollView.contentOffset.x/375;
//}
// 移动的时候
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _pageControl.currentPage = scrollView.contentOffset.x/375;
}
// 停止的时候
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    _pageControl.currentPage = scrollView.contentOffset.x/375;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    self.pageControl = nil;
    self.scrollView = nil;
    [super dealloc];
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
