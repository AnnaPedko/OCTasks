//
//  ICDirector.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICDirector.h"
#import "ICAccountant.h"

const static NSUInteger defaultMoney = 0;
const static NSUInteger defaultSalary = 0;
const static NSUInteger defaultExperience = 5;

@implementation ICDirector
@synthesize state;
@synthesize money;
@synthesize experience;
@synthesize salary;

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

- (void)performEmployeeSpecificOperation:(id)object {
    [self takeMoneyFromObject:object];
}

- (void)processObject:(id<ICFinancialFlow>)object {
    [super processObject:object];
    object.state = ICObjectFree;
    
}

@end
