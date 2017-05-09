//
//  ICEmployee.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICEmployee.h"

@implementation ICEmployee

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {
      return [super init];
}

- (void)performEmployeeSpecificOperation:(id)object {
    
};

- (void)takeMoneyFromObject:(id<ICFinancialFlow>)object {
    [self takeMoney:[object giveMoney]];
}

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

- (NSUInteger)giveMoney{
    NSUInteger money = self.money;
    self.money = 0;
    
    return money;
}

- (void)processObject:(id<ICFinancialFlow>)object {
    self.state = ICObjectBusy;
    [self performEmployeeSpecificOperation:object];
    self.state = ICObjectFree;
}

@end

