//
//  MenuTableViewCell.m
//  iFood
//
//  Created by Ezequiel Gutierrez on 15/9/16.
//  Copyright © 2016 Acamica. All rights reserved.
//

#import "FoodTableViewCell.h"

@interface FoodTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *foodImageView;
@property (nonatomic, weak) IBOutlet UIView *containerView;

@end

@implementation FoodTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.containerView.layer.cornerRadius = 10.0;
    self.containerView.layer.masksToBounds = YES;
    
    self.foodImageView.layer.cornerRadius = 4.0;
    self.foodImageView.layer.masksToBounds = YES;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setTile:(NSString*)title description:(NSString*)description andImageName:(NSString*)imageName{
    [self.titleLabel setText:title];
    [self.descriptionLabel setText:description];
    [self.foodImageView setImage:[UIImage imageNamed:imageName]];
}

@end
