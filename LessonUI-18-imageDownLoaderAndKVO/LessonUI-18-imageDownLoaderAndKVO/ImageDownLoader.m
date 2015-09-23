//
//  ImageDownLoader.m
//  LessonUI-18-imageDownLoaderAndKVO
//
//  Created by huchunyuan on 15/9/8.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ImageDownLoader.h"

@interface ImageDownLoader () <NSURLConnectionDataDelegate>
@property (nonatomic,retain)NSMutableData *data;// 用于拼接请求的数据
@property (nonatomic,retain)NSURLConnection *connection;// 存储请求对象
@end


@implementation ImageDownLoader
// 初始化方法
- (id)initWithImageURL:(NSString *)imageURL delegate:(id<imageDownLoaderDelegate>)delegate{
    self = [super init];
    if (self) {
        // 给delegate赋值
        self.delegate = delegate;
        
        // 进行请求
        [self requestImageWithImageURL:imageURL];
    }
    return self;
}
// 取消下载
- (void)cancle{
    [_connection cancel];
}
- (void)requestImageWithImageURL:(NSString *)imageURL{
    // 1.创建URL
    // (1)再编码
    NSString *newStr = [imageURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:newStr];
    // 2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3.请求 并设置代理
    self.connection =[NSURLConnection  connectionWithRequest:request delegate:self];
    
    
}
// 连接到服务器
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    if(_data==nil){
        self.data = [NSMutableData data];
    }
}
// 获取数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    // 拼接数据
    [_data appendData:data];
    [_delegate imageDownLoder:self didSucceedWithImage:[UIImage imageWithData:_data]];
}
// 加载完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    // 进行数据操作 转化图片 通知代理将图片拿走
    
}
@end
