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
#pragma mark Overload Methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ICObjectFree:
            return @selector(employeeDidFinishWork:);
        case ICObjectBusy:
            return @selector(employeeDidBecomeBusy:);
        case ICObjectReadyForProcessing:
            return @selector(employeeReadyForProcessing:);
        default:
            return [super selectorForState:state];
    }
}

- (void)employeeReadyForProcessing:(id)employee {
    NSLog(@"%@ ready for processing", employee);
    [self processObject:employee];
}

- (void)employeeDidBecomeBusy:(id)employee {
    NSLog(@" %@ became busy", employee);
}

- (void)finishProcessObject:(id)object {
}

- (void)finishWork {
    NSLog(@"%@ finish work", self);
    self.state = ICObjectReadyForProcessing;
}

- (void)performObjectSpecificOperation:(id)object {
};

#pragma mark -
#pragma Public Methods

- (void)processObject:(id<ICFinancialFlow>)object {
    self.state = ICObjectBusy;
    NSLog(@"%@ became process object %@",self, object);
    
    [self takeMoneyFromObject:object];
    [self performObjectSpecificOperation:object];
    [self finishProcessObject:object];
    [self finishWork];
}

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

@end

