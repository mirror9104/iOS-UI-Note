//
//  ViewController.m
//  LessonUI-17-NetworkRequest
//
//  Created by huchunyuan on 15/9/7.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ViewController.h"
#import "URL.h"

@interface ViewController ()<NSURLConnectionDataDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,retain)NSMutableData *data; //用来接收,拼接每一次获取的数据
@end

@implementation ViewController
/** 
 HTTP:是应用层的网络传输协议,对于HTTP的请求方式包括两种: GET 和 POST,连接方式也包括两种:同步连接 和 异步联接 
 GET 和 POST 的请求区别:
    1.GET请求:服务器的地址和请求参数都会出现在请求接口中,也就是说 服务器地址和请求参数共同组成了请求接口,而POST请求,请求参数不会出现在请求接口中,而是作为请求体提交给服务器
    2.因为GET请求的请求参数会出现在请求接口中,所以信息容易被捕获,安全性低 而POST请求的请求参数封装在请求体中,作为二进制流进行传输,安全性高
    3.GET请求的请求接口中由请求参数,而对于请求接口我们有字节限制,这样导致GET请求有一定局限性 所以对于GET请求只能上传小型数据,而对于POST请求,请求体理论上可以无限大 所以,一般来说,从服务器请求数据用GET,上传数据用POST
 
 
    已经宏定义了在URL文件中
    新闻:  http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213
 
    图片: http://image.zcool.com.cn/56/13/1308200901454.jpg
 
    土豆: http://api.tudou.com/v3/gw?method=album.channel.get&appKey=myKey&format=xml&channel=c&pageNo=1&pageSize=15
 */


/** 同步GET */
- (IBAction)synGET:(id)sender {
    
    // 1.创建url对象
    // (1)创建网址字符串
    NSString *urlStr = [NSString stringWithFormat:@"%@",kPicURL];
    // (2)再编码 url不允许出现中文,如果出现就再编码
    NSString *newStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    // (3)创建url
    NSURL *url = [NSURL URLWithString:newStr];
    
    // 2.创建request对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3.请求
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"回应:%@ 错误:%@",response,error);
    NSLog(@"%@",data);
    self.imageView.image = [UIImage imageWithData:data];
    // 解析
    NSDictionary *newDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *array = [newDic valueForKey:@"news"];
    NSString *imageurlStr =  [array[1] valueForKey:@"picUrl"];
    NSURL *imageurl = [NSURL URLWithString:imageurlStr];
    NSURLRequest *imagequest = [NSURLRequest requestWithURL:imageurl];
    NSData *imagedata = [NSURLConnection sendSynchronousRequest:imagequest returningResponse:nil error:nil];
    self.imageView.image = [UIImage imageWithData:imagedata];
}
/** 同步POST */
- (IBAction)synPOST:(id)sender {
    
    // 1.创建URL对象
    // (1)创建网址字符串
    NSString *urlStr = [NSString stringWithFormat:@"%@",@"http://api.tudou.com/v3/gw"];
    // (2)创建URL
    NSURL *url = [NSURL URLWithString:urlStr];
    // post请求不会出现中文,不涉及到重写可以简写
//    NSURL *url = [NSURL URLWithString:@"http://api.tudou.com/v3/gw"];
    
    // 2.创建可变请求对象
    NSMutableURLRequest *muRequest = [NSMutableURLRequest requestWithURL:url];
    
    // 3.设置请求体
    NSString *paraStr = @"method=album.channel.get&appKey=myKey&format=json&channel=c&pageNo=1&pageSize=15";
    NSData *data = [paraStr dataUsingEncoding:NSUTF8StringEncoding];
    [muRequest setHTTPBody:data];
    // 请求方式
    [muRequest setHTTPMethod:@"POST"];
    
    // 4.请求
    NSData *data2 = [NSURLConnection sendSynchronousRequest:muRequest returningResponse:nil error:nil];
    
    // 解析
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data2 options:0 error:nil];
    NSLog(@"%@",dic);
}
/** 异步GET */
- (IBAction)asynGET:(id)sender {
    // 1.创建URL对象
    // (1)创建网址字符串
    NSString *urlStr = [NSString stringWithFormat:@"%@",kPicURL];
    // (2)再编码
    NSString *newStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    // (3)创建url对象
    NSURL *url = [NSURL URLWithString:newStr];
    // 2.创建request对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3.请求 并设置 代理
//    NSURLConnection *connection =
//    [NSURLConnection connectionWithRequest:request delegate:self];
    // 取消请求
//    [connection cancel];
    //
    
    // 使用block 发送异步请求
    // block获取不到请求对象,无法停止,官方说内部自己实现了停止功能.
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 数据操作
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        
//        NSLog(@"%@",dic);
        _imageView.image = [UIImage imageWithData:data];
        
        
    }];
}
/** 异步POST */
- (IBAction)asynPOST:(id)sender {
    // 1.创建URL
    // (1)创建字符串
    NSURL *url = [NSURL URLWithString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx"];
    
    // 2.创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 3.设置请求体
    NSString *paraStr = @"date=20150904&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213";
    NSData *bodyData = [paraStr dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:bodyData];
    [request setHTTPMethod:@"POST"];
    // 4.请求 并设置代理
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}

#pragma mark - NSURLConnectionDataDelegate
// 连接到服务器
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
        self.data = [NSMutableData data];



}

// 接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    // 拼接数据
    [_data appendData:data];
    _imageView.image = [UIImage imageWithData:_data];
    
}

// 数据加载完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    // 数据请求完成,进行数据处理
    
    NSDictionary *newsDic = [NSJSONSerialization JSONObjectWithData:_data options:0 error:nil];
    NSLog(@"%@",newsDic);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imageView release];
    [super dealloc];
}
@end
