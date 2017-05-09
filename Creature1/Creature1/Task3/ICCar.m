//
//  ICCar.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCar.h"

@implementation ICCar

@synthesize state;
@synthesize salary;
@synthesize money;

- (void) dealloc {
    [super dealloc];
}

- (instancetype) init {
    self = [super init];
    if (self) {
        self.money = 200;
        self.state = ICObjectFree;
    }
    
    return self;
}

- (NSUInteger)giveMoney{
    NSUInteger carMoney = self.money;
    self.money = 0;
    
    return carMoney;
}
@end
