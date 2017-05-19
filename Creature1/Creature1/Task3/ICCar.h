//
//  ICCar.h
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ICFinancialFlow.h"
#import "ICLocation.h"

@interface ICCar : NSObject <ICFinancialFlow,ICLocation>

- (NSUInteger)giveMoney;

@end
