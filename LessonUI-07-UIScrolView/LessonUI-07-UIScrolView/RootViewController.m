//
//  RootViewController.m
//  LessonUI-07-UIScrolView
//
//  Created by huchunyuan on 15/8/21.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UIScrollViewDelegate>
@property (nonatomic,retain)UIScrollView *scrollView;
@property (nonatomic,retain)UIImageView *imageView;
@end

@implementation RootViewController
- (void)dealloc{
    self.scrollView = nil;
    self.imageView = nil;
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 布局ScrollView
    [self layoutScrollView];
    [self layoutImageView];
    
}
// 布局scrollView
- (void)layoutScrollView{
    // UIScrollView 是UI中可以滑动的视图,其实他是UIView的子类 只不过扩充了滑动方面的功能 我们今后学习的可以滑动的视图 比如UITableView,UITextView都是继承于他的子类
    // 1.创建对象
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    // 2.配置属性
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    // (1)设置内容大小 决定ScrollView是否可以滑动,当显示内容大小 > 当前视图大小时才可以进行滑动
    _scrollView.contentSize = CGSizeMake(375, 667*2);
    // (2)设置滚动条的风格
    _scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    // (3)隐藏 水平 和 竖直 滚动条
    // 水平
    _scrollView.showsHorizontalScrollIndicator = NO;
    // 竖直
    _scrollView.showsVerticalScrollIndicator = NO;
    // (4)设置反弹效果
    _scrollView.bounces = YES;
    // (5)设置整屏滑动 页面滚动 NO为不需要按照屏幕滚动
    _scrollView.pagingEnabled = NO;
    // (6)设置当前显示内容的偏移量
//    _scrollView.contentOffset = CGPointMake(0, 667);// 试过500也行
    _scrollView.contentOffset = CGPointMake(375, 667);
    // (7)点击状态栏 是否滑动到顶端
    _scrollView.scrollsToTop = YES;
    // (8)关闭滚动 NO为不允许滚动
    _scrollView.scrollEnabled = YES;
    // (9)当显示的内容小于视图大小时 内容视图是否进行反弹 (图片较小时NO不允许拖拽效果)
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.alwaysBounceVertical = YES;// 内容一样宽或高时 可以设置单一方向拖动
    // (10)设置代理
    _scrollView.delegate = self;
    // 3.添加父视图
    [self.view addSubview:_scrollView];
    // 4.释放所有权
    [_scrollView release];
    
    // 缩放
    // (1)设置最大比例
    _scrollView.maximumZoomScale = 2;
    // (2)设置最小比例
    _scrollView.minimumZoomScale = 0.1;
    // (3)设置变化比例
    _scrollView.zoomScale =1;
    // (4)设置是否缩放反弹
    _scrollView.bouncesZoom = YES;
}
// 布局imageView
- (void)layoutImageView{
    // 创建对象8
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667*2)];
    // 设置图片
    _imageView.image = [UIImage imageNamed:@"夕阳.jpg"];
    // 添加到父视图
    [_scrollView addSubview:_imageView];
    // 释放所有权
    [_imageView release];
}
#pragma mark - UIScrollViewDelegate
// 滚动
// 只要scrollView 滚动 就触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"翻滚吧,牛宝宝!!");
}
// 开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"将要开始拖拽");
}
// 已经结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"已经结束拖拽");
}
// 开始减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"将要开始减速");
}
// 已经结束 (停止)
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"停啦");
}
// 缩放
// 完成缩放 触发
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"开始缩放");
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"结束缩放");
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"正在缩放");
}
// 缩放 设置缩放子图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imageView;
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
