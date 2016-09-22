//
//  SettingsViewController.m
//  iFood
//
//  Created by Juliana Caccavo on 8/29/16.
//  Copyright © 2016 Acamica. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation SettingsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2;
    self.imageView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
