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

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation MenuListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self remoteCall];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) remoteCall {
    
    NSString *url = @"https://api.myjson.com/bins/1essw";
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // De esta forma, evitamos tener problemas de memoria al hacer referencia a self dentro de un bloque
    
    __weak MenuListViewController *weakSelf = self;
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error)
        {
            // Successful Response
            if ([response isKindOfClass:[NSHTTPURLResponse class]])
            {
                // Utilizamos NSJSONSerialization para convertir el JSON recibido en un Dictionary.
                NSError *jsonError;
                NSArray *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                if (!jsonError)
                {
                    // Success Parsing JSON
                    // Procesamos la info para actualizar nuestra tabla, siempre en el main thread
                    
                    [self serviceDidRespond:jsonResponse];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        weakSelf.foods = [[NSMutableArray alloc] init];
                        
                        for (NSDictionary *element in jsonResponse){
                            
                            Food *food = [[Food alloc] init];
                            food.name = [element objectForKey:@"name"];
                            food.foodImage = [element objectForKey:@"foodImage"];
                            food.foodDescription = [element objectForKey:@"foodDescription"];
                            
                            [weakSelf.foods addObject:food];
                        }
                        
                        [weakSelf.tableView reloadData];
                        
                    });
                }
            }
            else
            {
                //El servicio devuelve un error
            }
        }
        else
        {
            // Error
            NSLog(@"error : %@", error.description);
        }
    }];
    
    [dataTask resume];
    
}


- (void) serviceDidRespond: (NSArray*) array {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.foods = [[NSMutableArray alloc] init];
        
        for (NSDictionary *element in array){
            
            Food *food = [[Food alloc] init];
            food.name = [element objectForKey:@"name"];
            food.foodImage = [element objectForKey:@"foodImage"];
            food.foodDescription = [element objectForKey:@"foodDescription"];
            
            [self.foods addObject:food];
        }
        
        [self reloadData];
        
    });

}

- (void) reloadData {
    [self.tableView reloadData];
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
    return 114;
}

@end
