//
//  ImageDownLoader.h
//  LessonUI-18-imageDownLoaderAndKVO
//
//  Created by huchunyuan on 15/9/8.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageDownLoader;
@protocol imageDownLoaderDelegate <NSObject>

// 请求成功 将图片拿走
- (void)imageDownLoder:(ImageDownLoader *)imageDownLoader didSucceedWithImage:(UIImage *)image;

@end

@interface ImageDownLoader : NSObject

@property (nonatomic,assign)id<imageDownLoaderDelegate>delegate;
// 初始化方法
- (id)initWithImageURL:(NSString *)imageURL delegate:(id<imageDownLoaderDelegate>)delegate;
// 取消下载
- (void)cancle;
@end
