//
//  ICCarWashController.h
//  Creature1
//
//  Created by Anna P. on 15.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICQueue.h"
#import "ICCar.h"

@interface ICCarWashController : NSObject

- (void)createWasherQueue:(NSArray *)washers;
- (void)createCarQueue:(NSArray *)cars;
- (void)washCars;

@end
