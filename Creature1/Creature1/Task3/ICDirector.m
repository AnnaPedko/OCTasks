//
//  ICDirector.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICDirector.h"
#import "ICAccountant.h"

@implementation ICDirector
@synthesize state;
@synthesize money;
@synthesize experience;
@synthesize salary;

- (void) dealloc {
    
    [super dealloc];
}

- (instancetype) init {
    self = [super init];
    if (self) {
        self.money = 0;
        self.salary = 0;
        self.experience = 4;
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
