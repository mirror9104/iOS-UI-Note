//
//  DataHandle.m
//  AddressBook
//
//  Created by huchunyuan on 15/8/28.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//
#import "DataHandle.h"
#import "Contact.h"

static DataHandle *dataHandle = nil;

@implementation DataHandle
+ (DataHandle *)shareDateHandle{
    @synchronized(self){
        if (dataHandle == nil) {
            // 创建
            dataHandle = [[DataHandle alloc] init];
            [dataHandle readData];
            
        
        }
    }
    return dataHandle;
}
// 读取数据
- (void)readData{
    // 获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    // 获取数据字典
    NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    // 创建对象字典
    self.classDic = [NSMutableDictionary dictionary];
    // 遍历数据字典
    for (NSString *key in dataDic) {
        // 通过key获取对应的数据数组
        NSArray *dataArr = [dataDic valueForKey:key];
        // 创建对象数组
        NSMutableArray *group = [NSMutableArray array];
        // 将对象数组添加到 对象字典中
        [_classDic setValue:group forKey:key];
        // 遍历数据数组
        for (NSDictionary *dic in dataArr) {
            // 创建联系人对象 存储数据
            Contact *contac = [[Contact alloc] init];
            [contac setValuesForKeysWithDictionary:dic];
            
            // 将联系人添加到数组中
            [group addObject:contac];
            [contac release];
        }
    }
    // 获取所有的key并进行排序
    NSArray *sortedKeys = [[_classDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.allKeys = [NSMutableArray arrayWithArray:sortedKeys];
    
    NSLog(@"%@",_classDic);

}
// 添加联系人
- (void)addContact:(Contact *)contact{
    // 获取对分组名
    NSString *groupName = [self getFirstNameWithChineseName:contact.name];
    // h获取对应分组
    NSMutableArray *group = [_classDic valueForKey:groupName];
    if (group == nil) {
        group = [NSMutableArray array];
        // 添加到字典中
        [_classDic setValue:group forKey:groupName];
        // 添加新的key
        [_allKeys addObject:groupName];
        // 重新排序
        [_allKeys sortUsingSelector:@selector(compare:)];
    }
    // 将联系人添加到分组中
    [group addObject:contact];
    
}
- (NSString *)getFirstNameWithChineseName:(NSString *)name{
    // 转化为可变字符串
    NSMutableString *muName = [NSMutableString stringWithFormat:@"%@",name];
    // 转化为带音调的拼音
    CFStringTransform((CFMutableStringRef)muName, NULL, kCFStringTransformMandarinLatin, NO);
    // 转化为不带音调的拼音
    CFStringTransform((CFMutableStringRef)muName, NULL, kCFStringTransformStripDiacritics, NO);
    return [[muName substringToIndex:1] uppercaseString];
    
}
@end
