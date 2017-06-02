//
//  ICEmployee.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICEmployee.h"

@implementation ICEmployee

#pragma mark - 
#pragma mark Accessors


#pragma mark - 
#pragma mark Overloaded Methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ICObjectFree:
            return @selector(employeeDidFinishWork:);
        case ICObjectBusy:
            return @selector(employeeDidBecomeBusy:);
            
        default:
            return [super selectorForState:state];
    }
}

- (void)employeeDidFinishWork:(id)employee {
    [self processObject:employee];
}

- (void)employeeDidBecomeBusy:(id)employee {
    NSLog(@"Employee became busy %@", employee);
}

- (void)performObjectSpecificOperation:(id)object {
    
};

#pragma mark -
#pragma mark ICFinancialFlow Methods

- (void)takeMoneyFromObject:(id<ICFinancialFlow>)object {
    [self takeMoney:[object giveMoney]];
}

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

- (NSUInteger)giveMoney {
    NSUInteger money = self.money;
    self.money = 0;
    
    return money;
}

#pragma mark - 
#pragma Public Methods

- (void)processObject:(id<ICFinancialFlow>)object {
    self.state = ICObjectBusy;
    [self takeMoneyFromObject:object];
    [self performObjectSpecificOperation:object];
    self.state = ICObjectFree;
}

@end

