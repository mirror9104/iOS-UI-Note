//
//  ViewController.m
//  LessonUI-16-XMLPaser
//
//  Created by huchunyuan on 15/9/5.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"

@interface ViewController ()<NSXMLParserDelegate>
@property (nonatomic,copy)NSString *contentStr;// 记录读取的内容
@property (nonatomic,copy)NSString *fromName;// 发信人
@property (nonatomic,copy)NSString *toName;// 收信人
@property (nonatomic,copy)NSString *messageContent;// 信息
@property (nonatomic,copy)NSString *time;// 时间
@property (nonatomic,retain)NSMutableDictionary *categoryDic;// 分类字典
@property (nonatomic,retain)NSMutableArray *categoryArr;// 分类数组
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

/** 
 解析:以约定好的格式,后台开发人员将数据进行存储,前端人员按照对应格式进行数据获取的过程,数据格式是由后台人员决定 我们无权干涉.
 当今,流行的数据格式:XML和JSON
 对我们来说,数据解析就是根据XML或者JSON的格式进行数据的读取
 */

/** 
 XML解析方式 主要由两种:SAX解析 和DOM解析
 SAX解析式系统提供的,是根据协议代理回调的方式进行数据的获取 他在数据解析时,是将数据一条一条的进行读取解析,适合大型数据
 */
- (IBAction)SAXParser:(id)sender {
    // 创建字典
    self.categoryDic = [NSMutableDictionary dictionary];
    
    
    // 1.获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Categories" ofType:@"xml"];
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Message" ofType:@"xml"];
    
    // 2.读取文件内容
    NSData *parseData = [NSData dataWithContentsOfFile:filePath];
    
    // 3.创建解析对象
    NSXMLParser *paser = [[NSXMLParser alloc] initWithData:parseData];
    
    // 4.设置代理
    paser.delegate = self;
    
    // 5.解析
    [paser parse];
    
//    NSLog(@"\n%@:\n  %@\n                    %@\n                 %@",_toName,_messageContent,_fromName,_time);
    // 遍历字典
    for (NSString *key in _categoryDic) {
        // 获取对应分组
        NSMutableArray *group = [_categoryDic valueForKey:key];
        NSLog(@"---------------%@----------------",key);
        // 遍历分组
        for (NSString *str in group) {
            NSLog(@"%@",str);
        }
    }
    NSLog(@"%@",_categoryDic);

}

#pragma mark - SAX解析 NSXMLParserDelegate

// 读取到开始标签
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
//    NSLog(@"%@",elementName);
    if([elementName isEqualToString:@"category_name"]){
        // 创建对应分组
        self.categoryArr = [NSMutableArray array];
    }
}

// 获取内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
//    NSLog(@"%@",string);
    // 记录读取的内容
    self.contentStr = string;
}

// 读取到结束标签
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
//    NSLog(@"%@",elementName);
    if ([elementName isEqualToString:@"category_name"]) {
        // 将对应分组放入字典中 读取的内容 例如:美食 作为key
        [_categoryDic setValue:_categoryArr forKey:_contentStr];
    }else if ([elementName isEqualToString:@"subcategories"]){
        // 就将 读取的内容 放入数组中
        [_categoryArr addObject:_contentStr];
    }
    

//    // 结束时存储内容
//    if ([elementName isEqualToString:@"to"]) {
//        // 发信人
//        self.toName = _contentStr;
//    }else if ([elementName isEqualToString:@"from"]){
//        // 收信人
//        self.fromName = _contentStr;
//    }else if ([elementName isEqualToString:@"content"]){
//        // 信息内容
//        self.messageContent = _contentStr;
//    }else if ([elementName isEqualToString:@"time"]){
//        // 时间
//        self.time = _contentStr;
//    }
    
}

 /**
 DOM解析:一般使用由Google提供的第三方GDataXMLNode进行解析 对于DOM解析,会将数据整个读入内存,形成一个树形结构,我们通过树形结构的层级进行数据的获取 适合小型数据
 对于GdataXMLNode 是在C语言动态链接库基础上进行OC语言的XML解析工具
 在使用时 我们需要进行 三步配置:
  1.导入动态链接库 libxml2.2.dylib
  2.在 Header Search Path 中配置 /usr/include/libxml2
  3.在Other Linker 中配置 -lxml2
  
 */
- (IBAction)DOMParser:(id)sender {
    
    // 创建字典 承装解析后的数据
    self.categoryDic = [NSMutableDictionary dictionary];
    
    // 1.获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Categories" ofType:@"xml"];
    
    // 2.读取文件内容
    NSString *parseStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    // 3.将需要解析的内容读入 document
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithXMLString:parseStr options:0 error:nil];
    
    // 4.获取根节点
    GDataXMLElement *rootElement = [document rootElement];
    
    // 5.获取子节点们
//    NSArray *elments = [rootElement elementsForName:@"status"];
//    GDataXMLElement *status = [elments firstObject];
//    NSString *statusValue = [status stringValue];
//    NSLog(@"%@",statusValue);

    NSArray *elements = [rootElement elementsForName:@"categories"];
    // 遍历每一个子节点
    for (GDataXMLElement *element in elements) {
        // 获取下一级的子节点们
        NSArray *names = [element elementsForName:@"category_name"];
        NSArray *subcategories = [element elementsForName:@"subcategories"];
        
        // 获取叶子节点的值
        NSString *categoryName = [[names firstObject] stringValue];
        NSLog(@"--------------%@-------------------",categoryName);
        
        // 创建对应分组
        NSMutableArray *group = [NSMutableArray array];
        
        // 将分组放入字典
        [_categoryDic setValue:group forKey:categoryName];
        
        // 遍历子节点们
        for (GDataXMLElement * element in subcategories) {
            NSString * subStr = [element stringValue];
            NSLog(@"%@",subStr);
            // 将值放入分组
            [group addObject:subStr];
        }
    }
    NSLog(@"%@",_categoryDic);
}

@end
