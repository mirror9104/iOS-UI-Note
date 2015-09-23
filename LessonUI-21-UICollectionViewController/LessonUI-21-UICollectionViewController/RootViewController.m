//
//  RootViewController.m
//  LessonUI-21-UICollectionViewController
//
//  Created by huchunyuan on 15/9/14.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "MyCell.h"
#import "UIImageView+WebCache.h"
@interface RootViewController ()

@property (nonatomic,retain)NSMutableArray *imageURLs;// 存储 图片地址

@end

@implementation RootViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    // collection有两个View CollectionView在self view之上.
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    // 获取布局对象
//    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    
    // 这只item大小
//    layout.itemSize = CGSizeMake(500, 500);
    
    // 读取数据
    [self readData];
}

// 读取数据
- (void)readData{
    
    // 创建数组
    if (_imageURLs == nil) {
        self.imageURLs = [NSMutableArray array];
    }
    
    // 获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"json"];
    
    // 读取文件内容
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    // 解析
    NSArray *dataArr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    // 遍历数组
    for (NSDictionary *dic in dataArr) {
        // 获取 thumbURL 对应的防治
        NSString *thumbURL = [dic valueForKey:@"thumbURL"];
        
        // 放入数组
        [_imageURLs addObject:thumbURL];
        
    }
//    // 重读数据 但是用SDIMAGE 不需要重读
//    [self.collectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_imageURLs[indexPath.row]]];
    
    
    // Configure the cell
    cell.backgroundColor = [UIColor purpleColor];
    
    return cell;
}


// 点击cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld 分区 %ld 行",indexPath.section,indexPath.row);
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
