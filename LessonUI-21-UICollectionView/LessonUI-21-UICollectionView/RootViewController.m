//
//  RootViewController.m
//  LessonUI-21-UICollectionView
//
//  Created by huchunyuan on 15/9/14.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "MyCollectionCell.h"
#import "MyHeader.h"

@interface RootViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置tittle
    self.navigationItem.title = @"集合视图";
    
    // 布局UICollectionView
    [self layoutCollectionView];
}
// 布局UICollectionView
// UICollectionView 是一个新型的展示数据的视图,他和tableView使用起来一样,都需要设置dataSource 和delegate 只不过collectionView对于cell的设置比较复杂 可以实现很炫酷的效果
// 其实可以当做一个tableView的豪华升级展示视图
- (void)layoutCollectionView{
    // 创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    
//    // 设置cell大小
//    layout.itemSize = CGSizeMake(100, 150);
//    
//    // 设置 左右间距
//    layout.minimumInteritemSpacing =  0;
//    
//    // 设置 间距
//    // edge结构体 上下边距还可以当做设置分区之间的高度
//    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    
//    // 设置滚动的方向
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    
    // 1.创建控件对象
    // 创建初始必须给定一个cell布局对象
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    // 2.配置属性
    // collectionView默认的背景颜色 是黑色
    collectionView.backgroundColor = [UIColor whiteColor];
    
    // 设置代理
    collectionView.delegate = self;
    // 设置数据源
    collectionView.dataSource = self;
//
    // 注册cell
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [collectionView registerNib:[UINib nibWithNibName:@"MyCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    
    // 注册页眉
    // 系统
//    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    // 自定义
    [collectionView registerNib:[UINib nibWithNibName:@"MyHeader" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    
    // 注册页脚
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
    // 3.添加父视图
    [self.view addSubview:collectionView];
    
    // 4.释放所有权
    [collectionView release];
}

#pragma mark - UICollectionViewDataSource UICollectionViewDelegate
// 分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

// item数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// 设置cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text  = [NSString stringWithFormat:@"S:%ld row:%ld",indexPath.section,indexPath.row];
    cell.picImageView.image = [UIImage imageNamed:@"1"];

    return cell;
    
}

// 设置页眉
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    // 公共指针
    UICollectionReusableView *resuableView = nil;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        // 获取header
        resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        resuableView.backgroundColor = [UIColor greenColor];
        ((MyHeader *)resuableView).Label.text = [NSString stringWithFormat:@"%ld",indexPath.section];
        
        
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        // 获取footer
        resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
        resuableView.backgroundColor = [UIColor yellowColor];
    
    }
    return resuableView;
}
#pragma mark - UICollectionViewFlowLayoutDelegate

// item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row %2 == 0) {
//        return CGSizeMake(150, 300);
//    }
    return CGSizeMake(100, 150);
}

// 设置tiem左右间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    if (section == 0) {
        return 50;
    }else{
        return 0;
    }
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(0, 30, 0, 30);
    }
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

// 页眉
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(10, 50);
}

// 页脚
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(10, 100);
}
//// 设置上下间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 100;
//}

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

@end
