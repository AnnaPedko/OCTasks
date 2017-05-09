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

@implementation ICWasher
@synthesize state;

- (void)dealloc {
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.money = 0;
        self.salary = 0;
        self.experience = 2;
        self.state = ICObjectFree;
    }
    
    return self;
}

- (void)washCar:(id<ICFinancialFlow>)car {
    if (!car.state) {
        car.state = ICObjectFree;
    }
}

- (void)performEmployeeSpecificOperation:(id<ICFinancialFlow>)car {
    [self washCar:car];
    [self takeMoneyFromObject:car];
}

- (void)processObject:(id<ICFinancialFlow>)car{
    [super processObject:car];
    car.state = ICObjectBusy;
}

@end
