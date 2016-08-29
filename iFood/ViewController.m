//
//  ViewController.m
//  iFood
//
//  Created by Juliana Caccavo on 8/29/16.
//  Copyright © 2016 Acamica. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTestMethod:(id)sender{

}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField.text){
        [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
