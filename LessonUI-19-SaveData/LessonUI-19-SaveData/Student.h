//
//  Student.h
//  LessonUI-19-SaveData
//
//  Created by huchunyuan on 15/9/9.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject <NSCoding>
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *sex;
@property (nonatomic,copy)NSString *age;
@end
