//
//  ICCarWash.h
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICBuilding.h"

@interface ICCarWash : NSObject
@property (nonatomic, assign)   NSUInteger  money;
@property (nonatomic, retain)   ICBuilding* adminBuilding;
@property (nonatomic, retain)   ICBuilding* washBox;

- (void)washCars:(NSArray *)cars;

@end
