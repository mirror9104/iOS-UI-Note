//
//  ViewController.m
//  LessonUI-18-imageDownLoaderAndKVO
//
//  Created by huchunyuan on 15/9/8.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//
#define kPicURL @"http://image.zcool.com.cn/56/13/1308200901454.jpg"

#import "ViewController.h"
#import "ImageDownLoader.h"

@interface ViewController ()<imageDownLoaderDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,retain)ImageDownLoader *imageDownLoader;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startDownLoad:(id)sender {
    self.imageDownLoader = [[ImageDownLoader alloc] initWithImageURL:kPicURL delegate:self];
}
- (void)imageDownLoder:(ImageDownLoader *)imageDownLoader didSucceedWithImage:(UIImage *)image{
    self.imageView.image = image;
}
- (IBAction)cancleDownLoad:(id)sender {
    [_imageDownLoader cancle];
}
- (void)dealloc {
    [_imageView release];
    [super dealloc];
}
@end
