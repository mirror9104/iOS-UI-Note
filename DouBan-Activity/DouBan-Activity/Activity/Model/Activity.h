//
//  Activity.h
//  DouBan-Activity
//
//  Created by huchunyuan on 15/9/8.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDownLoader.h"
/** 
 title : 活动标题!
 begin_time : 开始时间!
 end_time :结束时间!
 address :地址! category_name:活动类型! participant_count:参加⼈人数! wisher_count:感兴趣⼈人数! image:活动图像(先显⽰示占位图像)! ! 
 name:活动举办⽅方!
 category_name:活动类型!
 */
@interface Activity : NSObject<imageDownLoaderDelegate>
@property (nonatomic,copy)NSString *title;// 活动标题
@property (nonatomic,copy)NSString *time;// 开始时间和结束时间拼接到一起
@property (nonatomic,copy)NSString *address;// 地址
@property (nonatomic,copy)NSString *category_name;// 活动类型
@property (nonatomic,copy)NSString *participant_count;// 参加人数
@property (nonatomic,copy)NSString *wisher_count;// 感兴趣人数
@property (nonatomic,copy)NSString *image;// 活动图像
@property (nonatomic,copy)NSString *name;// 活动举办方
@property (nonatomic,copy)NSString *content;// 活动内容

@property (nonatomic,copy)UIImage *picIamge;// 图片
@property (nonatomic,readonly)BOOL isLoading;// 是否正在加载
// 加载图片
- (void)loadImage;
@end
