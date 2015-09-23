//
//  RequestHandle.m
//  RequestHandle
//
//  Created by huchunyuan on 15/9/7.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RequestHandle.h"

@interface RequestHandle () <NSURLConnectionDataDelegate>
@property (nonatomic,retain)NSMutableData *data;// 用于拼接 闲散的数据
@property (nonatomic,retain)NSURLConnection *connection;// 用于接收请求对象

@end

@implementation RequestHandle
// 初始化
- (id)initWithUrlString:(NSString *)urlString parameter:(NSString *)parameter requestMethod:(NSString *)method delegate:(id<RequestHandleDelegate>)delegate{
    self = [super init];
    if (self) {
        // 代理的赋值
        self.delegate = delegate;
        
        if ([method isEqualToString:@"GET"]) {
            // 进行GET请求
            [self GETRequestWithURLString:urlString];
        }else if([method isEqualToString:@"POST"]){
            // 进行POST请求
            [self POSTRequestWithURLString:urlString parameter:parameter];
        }
    }
    return self;
}
// 取消请求的方法
- (void)cancleRequest{
    [_connection cancel];
}

// GET
- (void)GETRequestWithURLString:(NSString *)urlString{
    // 1.创建URL对象
    // 再编码
    NSString *urlStr = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 2.创建request对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3.请求 并设置代理
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
}
// POST
- (void)POSTRequestWithURLString:(NSString *)urlString parameter:(NSString *)parameter{
    // 1.创建url对象
    NSURL *url = [NSURL URLWithString:urlString];
    // 2.创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 3.设置请求体
    NSData *bodyData = [parameter dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:bodyData];
    [request setHTTPMethod:@"POST"];
    // 4.请求 并设置代理
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDataDelegate
// 连接服务器
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    if (_data == nil) {
        self.data = [NSMutableData data];
    }

}

// 获取数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    // 数据的拼接
    [_data appendData:data];
    
}

// 完成加载
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    // 通知代理将请求成功后的数据拿走
    [_delegate requestHandle:self didSucceedWithData:_data];

}

// 请求失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    // 通知代理将请求失败的数据拿走
    [_delegate requestHandle:self didFailWithError:error];

}


@end


