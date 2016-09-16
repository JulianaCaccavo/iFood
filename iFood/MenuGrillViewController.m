//
//  MenuGrillViewController.m
//  iFood
//
//  Created by Ezequiel Gutierrez on 16/9/16.
//  Copyright © 2016 Acamica. All rights reserved.
//

#import "MenuGrillViewController.h"
#import "Food.h"
#import "FoodCollectionViewCell.h"

@interface MenuGrillViewController () <UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *foods;

@end

@implementation MenuGrillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Food *spaghetti = [[Food alloc] init];
    spaghetti.name = @"Spaghetti";
    spaghetti.foodImage = @"spaghetti";
    spaghetti.foodDescription = @"Con queso gorgonzola, parmesano, trocitos de tocino y un toque de pan molido.";
    
    Food *fish = [[Food alloc] init];
    fish.name = @"Filete de pescado";
    fish.foodImage = @"fish";
    fish.foodDescription = @"Montado sobre papa martajada, bañado con salsa de jitomate, aceitunas negras, alcaparras y supremas de naranja.";
    
    Food *chicken = [[Food alloc] init];
    chicken.name = @"Pechuga de pollo";
    chicken.foodImage = @"chicken";
    chicken.foodDescription = @"Marinada en aceite de oliva, romero y ajo. Servida con berenjenas a la parrilla.";

    self.foods = [NSArray arrayWithObjects:spaghetti, fish, chicken, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
