//
//  MoviewListCollectionView.m
//  MovieList
//
//  Created by huchunyuan on 15/9/14.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "MoviewListCollectionView.h"
#import "WidthCell.h"

@interface MoviewListCollectionView ()
@property (nonatomic,assign)BOOL CHANGE;
@property (nonatomic,retain) UICollectionViewFlowLayout *layout;
@end

NSInteger cellHight = 140;
NSInteger cellWidth = 375;
@implementation MoviewListCollectionView
//static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"WidthCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cellW"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HightCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cellH"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemEdit) target:self action:@selector(change)];
    
    // 获取布局对象
    _layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    
    _layout.itemSize = CGSizeMake(375, 140);

    _CHANGE = YES;
}
- (void)change{
    _CHANGE = !_CHANGE;
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    
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

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WidthCell *cell = nil;
    if (_CHANGE) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellW" forIndexPath:indexPath] ;
        _layout.itemSize = CGSizeMake(375, 140);
        
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellH" forIndexPath:indexPath] ;
        _layout.itemSize = CGSizeMake(120, 160);
    }
    
    // Configure the cell
    
    return cell;
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
