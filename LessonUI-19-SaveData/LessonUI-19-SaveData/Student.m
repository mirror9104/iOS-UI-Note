//
//  Student.m
//  LessonUI-19-SaveData
//
//  Created by huchunyuan on 15/9/9.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)encodeWithCoder:(NSCoder *)aCoder{
    // 对实例变量 进行归档
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_sex forKey:@"sex"];
    [aCoder encodeObject:_age forKey:@"age"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
    }
    return self;
}
@end
