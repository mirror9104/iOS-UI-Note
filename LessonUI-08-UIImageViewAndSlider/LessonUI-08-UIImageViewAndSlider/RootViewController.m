//
//  RootViewController.m
//  LessonUI-08-UIImageViewAndSlider
//
//  Created by huchunyuan on 15/8/20.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (nonatomic,retain)UIImageView *imageView;
@end

@implementation RootViewController
- (void)dealloc{
    self.imageView = nil;
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 布局imageView
    [self layoutImageView];
    [self layoutSlider];
}
// 布局slider
- (void)layoutSlider{
    // UISlider 是UI中可以滑动控件,代表着一系列连续的值 一般用来控制 音量,进度等等.
    // 在使用上 和 其他UI控件一样
    // 在使用上 和其他UI控件一样
    
    // 1.创建对象
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 400, 275, 30)];
//    slider.transform = cgaffine
    
    // 2.配置属性
    // 设置划过区域颜色
    slider.minimumTrackTintColor = [UIColor redColor];
    // 设置未划过区域颜色
    slider.maximumTrackTintColor = [UIColor purpleColor];
    // 设置最大值 和最小值
    slider.minimumValue = 0.1;
    slider.maximumValue = 2;
    /** 旋转90度 */
    slider.transform = CGAffineTransformMakeRotation(M_PI / 2);
    // 当前值
    slider.value = 1;
    // 添加点击事件
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    // 3.添加父视图
    [self.view addSubview:slider];
    // 4.释放所有权
    [slider release];
    
}
- (void)sliderAction:(UISlider *)slider{
    NSLog(@"%.2f",slider.value);
//    self.view.backgroundColor = [UIColor colorWithRed:slider.value green:0 blue:0 alpha:1];
    // 最大值 - value 是调整速度 是提速
    // 直接导入slider.value 是控制一组动画的时间 是降速
    _imageView.animationDuration = 2-slider.value;
    [_imageView startAnimating];
}
- (void)layoutImageView{
    // 创建imageView对象
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 275, 200)];
    // 设置图片
    self.imageView.image = [UIImage imageNamed:@"1.tiff"];
    // 创建图片数组
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 1; i < 19; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.tiff",i];
        // 创建图片对象
        UIImage *image = [UIImage imageNamed:imageName];
        // 将图片对象保存到数组内
        [images addObject:image];
    }
    NSLog(@"%@",images);
    [self.view addSubview:_imageView];
    [_imageView release];

    // 添加动画数组
    _imageView.animationImages = images;
    // 设置每次播放的时间
    _imageView.animationDuration = 1;
    // 设置重复次数
    _imageView.animationRepeatCount = 1000;
    // 提交动画
    [_imageView startAnimating];
    
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
