//
//  SecondViewController.m
//  LessonUI-23-Animation
//
//  Created by huchunyuan on 15/9/16.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (retain, nonatomic) IBOutlet UIView *sunImage;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    // CALayer
    self.sunImage.layer.backgroundColor = [UIColor blackColor].CGColor;
    
    
    // 切圆角
    self.sunImage.layer.cornerRadius = 100;
    
    // 设置阴影的透明度 0->1 小->大
    self.sunImage.layer.shadowOpacity = 1;
    
    // 设置阴影的颜色 layer层只能用CGColor 互相的封装 跟绘制有关的都是CG开头
    self.sunImage.layer.shadowColor = [UIColor redColor].CGColor;
    
    // 设置阴影的偏移量
    self.sunImage.layer.shadowOffset = CGSizeMake(5, 5);
    
    // 设置阴影虚化
    self.sunImage.layer.shadowRadius = 50;
    
    // 设置边框颜色
    self.sunImage.layer.borderColor = [UIColor yellowColor].CGColor;
    // 设置边框狂赌
//    self.sunImage.layer.borderWidth = 2;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 基本动画
- (IBAction)cabasicAnimation:(id)sender {
    /**
     有两个重要的属性
     fromValue 初始值
     toValue 是目标值
     动画就是初始值到目标值的过度
     
     参数的作用:layer层的属性字符串形式
     
     */
    // 1.创建动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // 2.配置动画
    // 动画时间
    animation.duration = 1.0f;
    
    // 重复次数
    animation.repeatCount = 100;
    
    // 动画的初始值 formValue 需要id类型需要封装对象
    animation.fromValue = [NSValue valueWithCGPoint: CGPointMake(0, 200)];
    
    // 动画的目标值
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(375, 200)];
    
    // 3.添加动画
    [self.sunImage.layer addAnimation:animation forKey:@"position"];
    
    // 改变颜色
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    
    // 配置动画
    animation2.duration = 1.0f;
    animation2.repeatCount = 100;
    
    // 设置初始值
    animation2.fromValue = (id)[UIColor redColor].CGColor;
    
    // 动画的目标值
    animation2.toValue = (id)[UIColor yellowColor].CGColor;
    
    // 添加动画
    [self.sunImage.layer addAnimation:animation2 forKey:@"backgroundColor"];
}

//
- (IBAction)cakeyPathAnimation:(id)sender {
    /** 
     CAKeyFrameAnimation 有一个重要的属性 叫做path
     
     */
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.duration = 1;
    animation.repeatCount = 100;
    
    

    
    
    
    // 创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 添加起点
    CGPathMoveToPoint(path, NULL, 0, 0);
    
    
    
    // 添加关键路径点
    
//    CGPathAddLineToPoint(path, NULL, 375, 667);
//    CGPathAddLineToPoint(path, NULL, 0, 667);
//    CGPathAddLineToPoint(path, NULL, 0, 0);
    
//    CGPathAddLineToPoint(path, NULL, self.sunImage.center.x,  self.sunImage.center.y);
    CGFloat r = 375 / 2;
    CGPathMoveToPoint(path, NULL, 0,  375 / 2 + 100);
    for (float x = 1; x <375; x++) {
        
        //获取y
        float y = - sqrtf(r * r - (x - r)*(x - r)) + r + 100;
        
        CGPathAddLineToPoint(path, NULL, x, y);
    }
    for (float x = 374; x > 0; x--) {
        
        //获取y
        float y =  sqrtf(r * r - (x - r)*(x - r)) + r + 100;
        
        CGPathAddLineToPoint(path, NULL, x, y);
    }
    
    // 设置路径
    animation.path = path;
    
    // 添加动画
    [self.sunImage.layer addAnimation:animation forKey:@"position"];
}

//
- (IBAction)cavaluesAnimation:(id)sender {
//    CAKeyframeAnimation 关键属性 values
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    // 配置动画
    animation1.duration = 10;
    
    NSMutableArray * values = [NSMutableArray array];
    // 获取半径
    CGFloat r = 375 / 2;
    
    // 半圆
    for (int x = 0; x < 375; x++) {
        // 获取y
        float y = -sqrtf(r * r - (x - r)*(x - r)) + r + 150;
        // 创建点对象
        NSValue *value = [NSValue valueWithCGPoint:CGPointMake(x, y)];
        
        // 放入数组
        [values addObject:value];
    }
    animation1.values = values;
    // 添加动画
    [self.sunImage.layer addAnimation:animation1 forKey:@"position"];
    
    // 改变颜色
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    
    // 设置值数组
    animation2.values = @[
                           (id)[UIColor orangeColor].CGColor,
                           (id)[UIColor whiteColor].CGColor,
                           (id)[UIColor orangeColor].CGColor
                           ];
    animation2.repeatCount = 100;
    animation2.duration = 10;
     // 添加动画
     [self.sunImage.layer addAnimation:animation2 forKey:@"backgroundColor"];
}

//
- (IBAction)caanimationGroup:(id)sender {
    // 创建动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    // 创建动画1
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSMutableArray * values = [NSMutableArray array];
    // 获取半径
    CGFloat r = 375 / 2;
    
    // 半圆
    for (int x = 0; x < 375; x++) {
        // 获取y
        float y = -sqrtf(r * r - (x - r)*(x - r)) + r + 150;
        // 创建点对象
        NSValue *value = [NSValue valueWithCGPoint:CGPointMake(x, y)];
        
        // 放入数组
        [values addObject:value];
    }
    animation1.values = values;
    
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    
    animation2.values =@[
                         (id)[UIColor orangeColor].CGColor,
                         (id)[UIColor whiteColor].CGColor,
                         (id)[UIColor orangeColor].CGColor
                         ];
    // 将动画放入 动画组
    group.animations = @[animation1,animation2];
    group.duration = 5;

    // 添加动画
    [self.sunImage.layer addAnimation:group forKey:nil];
}

- (IBAction)catransitionAnimation:(id)sender {
    /** 
     pageCurl            向上翻一页
     
     pageUnCurl          向下翻一页
     rippleEffect        滴水效果
     suckEffect          收缩效果，如一块布被抽走
     cube                立方体效果
     oglFlip             上下翻转效果
     过度动画
     */
    CATransition *transtion = [CATransition animation];
    
    // 配置动画
    transtion.type = @"suckEffect";
    transtion.subtype = @"fromLeft";
    
    transtion.duration = 5;
    transtion.repeatDuration = 10;
    [self.sunImage.layer addAnimation:transtion forKey:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_sunImage release];
    [super dealloc];
}
@end
