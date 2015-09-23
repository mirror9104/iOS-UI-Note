//
//  Activity.m
//  DouBan-Activity
//
//  Created by huchunyuan on 15/9/8.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "Activity.h"


@implementation Activity
// 找不到对应属性时触发
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"owner"]) {
        self.name = [value valueForKey:@"name"];
    }
    if ([key isEqualToString:@"begin_time"]) {
        // "begin_time" :"2014-07-22 "
        self.time = [value substringWithRange:NSMakeRange(5, 11)];
    }
    if ([key isEqualToString:@"end_time"]) {
        NSString *endTime = [value substringWithRange:NSMakeRange(5, 11)];
        self.time = [NSString stringWithFormat:@"%@ -- %@",_time,endTime];
    }
}
// 找到key对应的属性
- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"participant_count"]) {
        self.participant_count = [NSString stringWithFormat:@"%@",value];
    }
    if ([key isEqualToString:@"wisher_count"]) {
        self.wisher_count = [NSString stringWithFormat:@"%@",value];
    }
}
- (void)loadImage{
    [[ImageDownLoader alloc] initWithImageURL:self.image delegate:self];
    // 设置标识
    _isLoading = YES;
}

// 请求成功
- (void)imageDownLoder:(ImageDownLoader *)imageDownLoader didSucceedWithImage:(UIImage *)image{
    self.picIamge = image;
    // 改变标识
    _isLoading = NO;
}
@end
