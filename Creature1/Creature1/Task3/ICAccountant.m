//
//  ICAccountant.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICAccountant.h"
#import "ICCarWash.h"

@implementation ICAccountant

@synthesize condition;

- (instancetype) init {
    self = [super init];
    if (self) {
        self.money = 0;
        self.experience = 5;
        self.salary = 0;
        self.condition = false;
    }
    return self;
}

- (void) dealloc {
    [super dealloc];
}

- (void) takeMoney:(ICCarWash*)carWash {
    if (carWash.isReady) {
        self.money = carWash.money;
        carWash.money = 0;
        carWash.condition = false;
    }
}

- (void) performEmployeeSpecificOperation:(ICEmployee *) employee {
    employee.salary = 0.1 * self.money;
    self.money -= employee.salary;
    self.condition = true;
}

@end
