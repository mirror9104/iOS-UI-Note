//
//  FirstViewController.m
//  LessonUI-23-Animation
//
//  Created by huchunyuan on 15/9/16.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,assign) CGPoint lastCenter;// 记录原来中心点的位置

@property (nonatomic,assign)CGAffineTransform transform;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lastCenter = _imageView.center;
    self.transform = _imageView.transform;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 基本动画
- (IBAction)contactAnimation:(id)sender {
    // 移除动画
    [self.imageView.layer removeAllAnimations];
    
    // 1.创建动画
    // (1)第一个参数给动画起一个名字
    // (2)第二个参数 为哪一个视图做的动画
    [UIView beginAnimations:@"myAnimation" context:_imageView];
   
    // 2.配置动画
    // 设置动画时间
    [UIView setAnimationDuration:1];
    
    // 设置是否重复
    [UIView setAnimationRepeatAutoreverses:YES];
    
    // 设置重复次数
    [UIView setAnimationRepeatCount:1];
    
    // 设置动画延迟的时间
    [UIView setAnimationDelay:1];
    
    // 设置视图的最终状态
    self.imageView.center = CGPointMake(0, 0);
    
    // 设置代理
    [UIView setAnimationDelegate:self];
    
    // 动画开始时做什么
    // 方法名字固定 要点进类库复制方法
    [UIView setAnimationWillStartSelector:@selector(animationWillStart:context:)];
    
    // 动画结束时做什么
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    // 3.提交动画
    [UIView commitAnimations];
    
}

// 动画开始
- (void)animationWillStart:(NSString *)animationID context:(void *)context{
    NSLog(@"ID:%@ context:%@ ",animationID,context);
}

// 动画结束
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    NSLog(@"ID:%@ finish:%@ context:%@",animationID,finished,context);
    // 将视图回归到原来的位置
    self.imageView.center = _lastCenter;
}


// 平移
- (IBAction)translationAnimation:(id)sender {
    // 移除动画
    [self.imageView.layer removeAllAnimations];
    
    // 第一种方法
//    [UIView animateWithDuration:1 animations:^{
//        self.imageView.transform =CGAffineTransformTranslate(self.imageView.transform, 100, 100);
//    }];
    
    // 第二种方法添加一个完成动画后的效果


    [UIView animateWithDuration:1 animations:^{
        // 动画效果
        self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, 100, 100);
    } completion:^(BOOL finished) {
        // 动画结束后做什么
        [UIView animateWithDuration:1 animations:^{
            self.imageView.transform = _transform;
        }];
    }];


}

// 旋转
- (IBAction)rotationAnimation:(id)sender {
    // 移除动画
    [self.imageView.layer removeAllAnimations];
    
    [UIView animateWithDuration:1 animations:^{
        // 旋转
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
//            self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
        }];
    }];
   

}

// 缩放
- (IBAction)scaleAnimation:(id)sender {
    // 移除动画
    [self.imageView.layer removeAllAnimations];
    
    [UIView animateKeyframesWithDuration:0.1 delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        
        // 缩放
        self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 2, 2);
    } completion:^(BOOL finished) {
        // 移除动画
        [self.imageView.layer removeAllAnimations];
        self.imageView.transform = _transform;
    }];
}

// 过度
- (IBAction)transitionAnimation:(id)sender {
    
    UIView *aView = [[UIView alloc] initWithFrame:self.imageView.bounds];
    aView.backgroundColor = [UIColor blueColor];
    [self.imageView addSubview:aView];
    [aView release];
    
    UIView *bView = [[UIView alloc] initWithFrame:self.imageView.bounds];
    bView.backgroundColor = [UIColor yellowColor];
    [self.imageView addSubview:bView];
    [bView release];
    
    // 过度
    [UIView transitionFromView:bView toView:aView duration:2 options:UIViewAnimationOptionTransitionCurlDown completion:^(BOOL finished) {
        [UIView transitionFromView:aView toView:bView duration:2 options:UIViewAnimationOptionTransitionCurlDown completion:^(BOOL finished) {
            
        }];
    }];
    
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
