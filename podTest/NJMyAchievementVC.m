//
//  NJMyAchievementVC.m
//  Destination
//
//  Created by TouchWorld on 2018/10/15.
//  Copyright © 2018 Redirect. All rights reserved.
//

#import "NJMyAchievementVC.h"
#import "NJMyAchievementCell.h"
#import "NJMyAchievementSectionHeaderView.h"
#import "NJMyAchievementHeaderView.h"

@interface NJMyAchievementVC () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/********* collectionView *********/
@property(nonatomic,weak)UICollectionView * collectionView;
/********* headerView *********/
@property(nonatomic,strong)NJMyAchievementHeaderView * headerView;

@end

@implementation NJMyAchievementVC
static NSString * const ID = @"NJMyAchievementCell";
static NSString * const HeaderID =  @"NJMyAchievementSectionHeaderView";
static CGFloat const headerViewHeight = 124;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupInit];
}

#pragma mark - 设置初始化
- (void)setupInit
{
    [self setupNaviBar];
}

#pragma mark - 导航条
- (void)setupNaviBar
{
    self.title = @"我的成就";
    
    [self setupCollectionView];
}

#pragma mark - collectionView
- (void)setupCollectionView
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 13;
    flowLayout.minimumInteritemSpacing = 14;
    flowLayout.itemSize = CGSizeMake(72, 66);
    
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    self.collectionView = collectionView;
    
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.contentInset = UIEdgeInsetsMake(headerViewHeight, 0, 5, 0);
    collectionView.backgroundColor = [UIColor whiteColor];
    
    
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NJMyAchievementCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NJMyAchievementSectionHeaderView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID];
    
    [collectionView addSubview:self.headerView];
}

#pragma mark - UICollectionViewDataSource方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NJMyAchievementCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    NJLog(@"%p--%ld", cell, indexPath.row);
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if(kind == UICollectionElementKindSectionHeader)
    {
        NJMyAchievementSectionHeaderView * sectionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID forIndexPath:indexPath];
        return sectionHeaderView;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(NJScreenW, 53);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 22, 0, 22);
}

#pragma mark - 懒加载
- (NJMyAchievementHeaderView *)headerView
{
    if(_headerView == nil)
    {
        _headerView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NJMyAchievementHeaderView class]) owner:nil options:nil].firstObject;;
        _headerView.frame = CGRectMake(0, -headerViewHeight, NJScreenW, headerViewHeight);
    }
    return _headerView;
}

@end
