//
//  ICAccountant.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICAccountant.h"
#import "ICCarWash.h"

const static NSUInteger ICDefaultExperience = 5;
const static double interestSalary = 0.1;

@implementation ICAccountant

@synthesize money;

- (instancetype) init {
    self = [super init];
    if (self) {
        self.experience = ICDefaultExperience;
    }
    
    return self;
}

- (void)performObjectSpecificOperation:(id)object {
    [super performObjectSpecificOperation:object];
    [self calculateSalary:object];
}

- (void)calculateSalary:(ICEmployee *)employee {
    employee.salary = interestSalary * self.money;
    self.money -= employee.salary;
}

@end
