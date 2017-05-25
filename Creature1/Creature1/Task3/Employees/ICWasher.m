//
//  ICWasher.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICWasher.h"
#import "ICCar.h"
#import "ICCarWash.h"

const static NSUInteger defaultMoney = 0;
const static NSUInteger defaultSalary = 0;
const static NSUInteger defaultExperience = 2;

@implementation ICWasher
@synthesize state;

- (void)dealloc {
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.money = defaultMoney;
        self.salary = defaultSalary;
        self.experience = defaultExperience;
        self.state = ICObjectFree;
    }
    
    return self;
}

- (void)washCar:(ICCar *)car {
    if (!car.clean) {
        car.clean = YES;
    }
}

- (void)performObjectSpecificOperation:(id<ICFinancialFlow>)car {
    [self washCar:car];
}

- (void)processObject:(id<ICFinancialFlow>)car{
    [super processObject:car];
}

@end
