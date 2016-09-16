//
//  MenuListViewController.m
//  iFood
//
//  Created by Ezequiel Gutierrez on 15/9/16.
//  Copyright © 2016 Acamica. All rights reserved.
//

#import "MenuListViewController.h"
#import "Food.h"
#import "FoodTableViewCell.h"

@interface MenuListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *foods;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation MenuListViewController

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
    
    self.foods = [NSMutableArray arrayWithObjects:spaghetti, fish, chicken, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.foods.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Food *food = [self.foods objectAtIndex:indexPath.row];
    
    FoodTableViewCell *cell = (FoodTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"FoodCellIdentifier" forIndexPath:indexPath];
    
    [cell setTile:food.name description:food.foodDescription andImageName:food.foodImage];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
