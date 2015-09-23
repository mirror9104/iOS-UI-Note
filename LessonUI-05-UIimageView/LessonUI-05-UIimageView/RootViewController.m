//
//  RootViewController.m
//  LessonUI-05-UIimageView
//
//  Created by huchunyuan on 15/8/19.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (nonatomic,retain)UIImageView *imageView;
@property (nonatomic,retain)NSMutableArray *images;// 图片名字 数组
@property (nonatomic,assign)NSInteger index;// 下标
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建数组
    self.images = [NSMutableArray array];
    // 循环 创建图片名字
    for (int i = 0;i < 8; i++) {
        NSString *imageName = [NSString stringWithFormat:@"h%d.jpeg",i];
        [_images addObject:imageName];
    }
    // 将下标置为0
    _index = 0;
     NSLog(@"%@",_images);
    // 布局imageView
    [self layoutImageView];
    
    
    // 创建手势
    [self creatRecognizers];
}
// 创建手势
- (void)creatRecognizers{
    // 七大手势
    // 1.轻拍手势
    // 创建轻拍手势对象
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    // 配置属性
    // 轻拍次数
    tap.numberOfTapsRequired = 1;
    // 轻拍手势的个数
    tap.numberOfTouchesRequired = 1;
    // 将手势 添加到指定视图上
    [_imageView addGestureRecognizer:tap];
    // 释放所有权
    [tap release];
    
    // 移除轻拍手势
    [_imageView removeGestureRecognizer:tap];
    
    // 2.清扫手势
    // 创建清扫手势对象
    // 一个清扫手势只能有两个方向 (上和下)或者(左和右)
    // 如果想支持上 下 左 右 清扫,那么一个手势不能实现 需要创建2个清扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    // 配置属性
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    // 添加到指定视图
    [_imageView addGestureRecognizer:swipe];
    // 释放所有权
    [swipe release];
    UISwipeGestureRecognizer *swipe2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    // 设置清扫方向
    swipe2.direction = UISwipeGestureRecognizerDirectionRight;
    // 释放所有权
    [_imageView addGestureRecognizer:swipe2];
    [swipe2 release];
    // 移除 清扫手势
    [_imageView removeGestureRecognizer:swipe];
    [_imageView removeGestureRecognizer:swipe2];
    //3.长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    // 配置属性
    // 默认是0.5秒
    // 最短长按的时间
    longPress.minimumPressDuration = 1;
    // 长按时可移动的距离
    longPress.allowableMovement = 100;
    // 添加到指定视图
    [_imageView addGestureRecognizer:longPress];
    // 释放所有权
    [longPress release];
    [_imageView removeGestureRecognizer:longPress];
    
    // 平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    // 添加到指定视图
    [_imageView addGestureRecognizer:pan];
    [pan release];
    [_imageView removeGestureRecognizer:pan];
    //5.捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    // 添加到指定视图
    [_imageView addGestureRecognizer:pinch];
    [pinch release];
    [_imageView removeGestureRecognizer:pinch];
    // 旋转手势
    UIRotationGestureRecognizer *rote = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(roteAction:)];
    // 添加到指定视图
    [_imageView addGestureRecognizer:rote];
    // 释放所有权
    [rote release];
    [_imageView removeGestureRecognizer:rote];
    
    // 屏幕边缘手势
    UIScreenEdgePanGestureRecognizer *screenPan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenPanAction:)];
    // 属性
    // 设置边缘手势的位置
    screenPan.edges = UIRectEdgeLeft;
    // 添加视图
    [_imageView addGestureRecognizer:screenPan];
    // 释放所有权
    
    
}
#pragma mark - 手势触发事件
// 轻拍事件
- (void)tapAction:(UITapGestureRecognizer *)tap{
    NSLog(@"拍了一下");
    // 图片的切换
    _index++;
    if (_index == 8) {
        _index = 0;
    }
    self.imageView.image = [UIImage imageNamed:_images[_index]];
}
// 清扫事件
- (void)swipAction:(UISwipeGestureRecognizer *)swipe{
    // 判断当前是 左清扫 还是 右清扫
    NSLog(@"%ld",UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight);
    // 通过清扫方向进行判定
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"右清扫");
        _index -- ;
        if (_index < 0) {
            _index = 7;
        }
        _imageView.image = [UIImage imageNamed:_images[_index]];
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionLeft){
        _index ++;
        if (_index == 8) {
            _index = 0;
        }
        _imageView.image = [UIImage imageNamed:_images[_index]];
        NSLog(@"左清扫");
    }
    
    
    
//    if (swipe.direction == (swipe.direction ^ UISwipeGestureRecognizerDirectionRight)) {
//        NSLog(@"左清扫");
//    }else if((swipe.direction ^ UISwipeGestureRecognizerDirectionLeft) == UISwipeGestureRecognizerDirectionRight){
//        NSLog(@"右清扫");
//    }
}
// 长按事件
- (void)longPressAction:(UILongPressGestureRecognizer *)longPress{
//    NSLog(@"长按");
    // 对于长按手势有开始 和 结束状态
    if (longPress.state == UIGestureRecognizerStateBegan){
        NSLog(@"长按开始");
        // 将图片保存到相册
//        UIImageWriteToSavedPhotosAlbum(<#UIImage *image#>, <#id completionTarget#>, <#SEL completionSelector#>, <#void *contextInfo#>)
    }
}
// 平移
- (void)panAction:(UIPanGestureRecognizer *)pan{
    // 获取手势的位置
    CGPoint position = [pan translationInView:_imageView];
    // 通过transform 进行平移变换
    _imageView.transform = CGAffineTransformTranslate(_imageView.transform, position.x, position.y);
    // 将手势增量置为0
    [pan setTranslation:CGPointZero inView:_imageView];
}
// 捏合事件
- (void)pinchAction:(UIPinchGestureRecognizer *)pinch{
    // 通过transform 进行直接视图捏合
    _imageView.transform = CGAffineTransformScale(_imageView.transform, pinch.scale, pinch.scale);
    // 不能置为0 等比例为1
    pinch.scale = 1;
}
// 旋转
- (void)roteAction:(UIRotationGestureRecognizer *)rote{
    // 通过 transform 进行旋转变换
    _imageView.transform = CGAffineTransformRotate(_imageView.transform, rote.rotation);
    // 为了防止累加 将循环增量置为0;
    rote.rotation = 0;
}
// 屏幕边缘事件
- (void)screenPanAction:(UIScreenEdgePanGestureRecognizer *)screenPan{
    NSLog(@"屏幕边缘手势");
}
- (void)dealloc{
    self.imageView = nil;
    self.images = nil;
    [super dealloc];
}
// 布局imageView
- (void)layoutImageView{
    // UIImageView 是iOS中展示图片的类,相当于相框的存在 他在使用上 和UILabel没有区别
    // 1.创建对象
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    // 2.配置属性
//    imageView.backgroundColor = [UIColor purpleColor];
    // (1)设置图片
    // 创建UIImage对象
//    UIImage *image = [UIImage imageNamed:@"2"];
//    imageView.image = image;
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    imageView.image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"h0" ofType:@"jpeg"]];
    
    // 3.添加父视图
    [self.view addSubview:imageView];
    // 4.释放所有权
    
    [imageView release];
    
    NSLog(@"imageView:%@",NSStringFromCGRect(imageView.frame));
    // 将创建的图片视图对象 给属性赋值
    self.imageView = imageView;
    // 打开用户交互
    self.imageView.userInteractionEnabled = YES;
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
