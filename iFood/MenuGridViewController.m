//
//  MenuGridViewController.m
//  iFood
//
//  Created by Ezequiel Gutierrez on 16/9/16.
//  Copyright © 2016 Acamica. All rights reserved.
//

#import "MenuGridViewController.h"
#import "Food.h"
#import "FoodCollectionViewCell.h"

@interface MenuGridViewController () <UICollectionViewDataSource>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation MenuGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) reloadData {
    [self.collectionView reloadData];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.foods.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Food *food = [self.foods objectAtIndex:indexPath.row];
    
    FoodCollectionViewCell *cell = (FoodCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"CellReuseIdentifier" forIndexPath:indexPath];
    
    [cell setTile:food.name andImageName:food.foodImage];
    
    return cell;
}

#pragma mark UICollectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    int padding = 12;
    CGFloat cellWidthHeight = (collectionView.frame.size.width / 2) - padding;
    return CGSizeMake(cellWidthHeight, cellWidthHeight);
}


@end
