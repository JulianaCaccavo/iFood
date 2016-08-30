//
//  Food.h
//  iFood
//
//  Created by Daniel Ezequiel Pilla on 8/30/16.
//  Copyright © 2016 Acamica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* foodDescription;
@property (nonatomic, assign) float value;

@end
