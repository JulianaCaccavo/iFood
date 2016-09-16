//
//  FoodCollectionViewCell.m
//  iFood
//
//  Created by Ezequiel Gutierrez on 16/9/16.
//  Copyright © 2016 Acamica. All rights reserved.
//

#import "FoodCollectionViewCell.h"

@interface FoodCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *foodImageView;

@end

@implementation FoodCollectionViewCell

- (void) setTile:(NSString*)title andImageName:(NSString*)imageName{
    [self.titleLabel setText:title];
    [self.foodImageView setImage:[UIImage imageNamed:imageName]];
}

@end
