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
const static double ICInterestSalary = 0.1;

@implementation ICAccountant

@synthesize money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype) init {
    self = [super init];
    if (self) {
        self.experience = ICDefaultExperience;
    }
    
    return self;
}

#pragma mark -
#pragma mark Overload methods

- (void)performObjectSpecificOperation:(id)object {
    @synchronized (self) {
        [self calculateSalary:object];
    }
}

- (void)finishProcessObject:(ICEmployee *)object {
    NSLog(@" %@ finishProcessObject %@", self, object);
    object.state = ICObjectFree;
}

#pragma mark -
#pragma mark Private methods

- (void)calculateSalary:(ICEmployee *)employee {
    employee.salary = ICInterestSalary * self.money;
    self.money -= employee.salary;
}

@end
