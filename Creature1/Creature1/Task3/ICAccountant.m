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
@synthesize state;
@synthesize money;
@synthesize salary;
- (void) dealloc {
    [super dealloc];
}

- (instancetype) init {
    self = [super init];
    if (self) {
        self.money = 0;
        self.experience = 5;
        self.salary = 0;
        self.state = ICObjectFree;
    }
    
    return self;
}

- (void)performEmployeeSpecificOperation:(id)object {
    [self takeMoneyFromObject:object];
    [self countSalary:object];
}

- (void)countSalary:(id<ICFinancialFlow>)employee {
    employee.salary = 0.1 * self.money;
    self.money -= employee.salary;
}

- (void)processObject:(id<ICFinancialFlow>)object {
    [super processObject:object];
    object.state = ICObjectFree;
    
    }

@end
