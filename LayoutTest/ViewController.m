//  Created by Alexander Skorulis on 28/01/2016.
//  Copyright © 2016 Alex Skorulis. All rights reserved.

#import "ViewController.h"
#import "TestCell.h"
#import "LeftCell.h"
#import <Masonry/Masonry.h>

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController {
    UICollectionViewFlowLayout *_layout;
    UICollectionView *_collectionView;
}

- (instancetype)init {
    self = [super init];
    self.title = @"Layout Test";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[TestCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerClass:[LeftCell class] forCellWithReuseIdentifier:@"left"];
    
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name = indexPath.section == 0 ? @"cell" : @"left";
    return [_collectionView dequeueReusableCellWithReuseIdentifier:name forIndexPath:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.editing) {
        return CGSizeMake(150, 30);
    }
    return CGSizeMake(80, 30);
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [_collectionView performBatchUpdates:^{
        [_layout invalidateLayout];
    } completion:nil];
    
}


@end
