//
//  RequestHandle.h
//  RequestHandle
//
//  Created by huchunyuan on 15/9/7.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RequestHandle;

@protocol RequestHandleDelegate <NSObject>

// 请求成功 获取数据
- (void)requestHandle:(RequestHandle *)requestHandle didSucceedWithData:(NSData *)data;

// 请求失败 获取失败信息
- (void)requestHandle:(RequestHandle *)requestHandle didFailWithError:(NSError *)error;

@end

@interface RequestHandle : NSObject
// 代理属性
@property (nonatomic,assign)id<RequestHandleDelegate>delegate;
// 初始化
- (id)initWithUrlString:(NSString *)urlString parameter:(NSString *)parameter requestMethod:(NSString *)method delegate:(id<RequestHandleDelegate>)delegate;
// 取消请求的方法
- (void)cancleRequest;
@end
