//
//  ICEmployee.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICEmployee.h"

@interface ICEmployee ()
- (void)processInBackgroundWithObject:(id<ICFinancialFlow>)object;
- (void)performProcessingOnMainWithObject:(id<ICFinancialFlow>)object;
- (void)sleep;

@end

static const NSUInteger ICSleepDuration = 10;

@implementation ICEmployee

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.queue = [ICQueue object];
    }
    
    return self;
}

#pragma mark -
#pragma Public Methods

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (state == self.state) {
            return;
        }
        
        if (state == ICEmployeeFree) {
            id object = [self.queue dequeue];
            if (object) {
                state = ICEmployeeBusy;
                [self processInBackgroundWithObject:object];
            }
        }
        [super setState:state];
    }
}

- (void)processObject:(id<ICFinancialFlow>)object {
    @synchronized (self) {
        if (ICEmployeeFree == self.state) {
            self.state = ICEmployeeBusy;
            NSLog(@"%@ became process object %@",self, object);
            
            [self processInBackgroundWithObject:object];
            NSLog(@" %@ money = %lu" , self, self.money);
        } else {
            [self.queue enqueue:object];
        }
    }
}


#pragma mark -
#pragma mark Overload Methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ICEmployeeFree:
            return @selector(employeeDidBecomeFree:);
        case ICEmployeeBusy:
            return @selector(employeeDidBecomeBusy:);
        case ICEmployeeReadyForProcessing:
            return @selector(employeeReadyForProcessing:);
        default:
            return [super selectorForState:state];
    }
}

- (void)performObjectSpecificOperation:(id)object {
    
}

- (void)performBackgroundProcessingObject:(id<ICFinancialFlow>)object {
    NSLog(@" %@ Perform Background thread with object = %@", self, object);
    
    [self sleep];
    
    [self takeMoneyFromObject:object];
    [self performObjectSpecificOperation:object];

    [self performSelectorOnMainThread:@selector(performProcessingOnMainWithObject:)
                           withObject:object
                        waitUntilDone:NO];
}

- (void)performProcessingOnMainWithObject:(id<ICFinancialFlow>)object {
    NSLog(@"%@  performProcessingOnMainWithObject  -> object = %@", self,object);
    
    [self finishProcessingObject:object];
    [self finishWork];
}


- (void)employeeReadyForProcessing:(id)employee {
    @synchronized (self) {
        [self.queue enqueue:employee];
        
        NSLog(@"%@ ready for processing", employee);
        [self processInBackgroundWithObject:[self.queue dequeue]];
    }
}

- (void)sleep {
    usleep((uint32)arc4random_uniform(1000 * 1000 * ICSleepDuration));
}

- (void)processInBackgroundWithObject:(id)object {
    [self performSelectorInBackground:@selector(performBackgroundProcessingObject:) withObject:object];
}

- (void)finishProcessingObject:(ICEmployee *)object {
    object.state = ICEmployeeFree;
}

- (void)finishWork {
    NSLog(@"%@ finishProcessing", self);
    id object = [self.queue dequeue];
    if (object) {
        [self processInBackgroundWithObject:object];
        NSLog(@"%@ Money = %lu",self, self.money);

    } else {
        NSLog(@"%@ Money = %lu",self, self.money);
        self.state = ICEmployeeReadyForProcessing;
    }
}

#pragma mark -
#pragma mark ICFinancialFlow Methods

- (void)takeMoneyFromObject:(id<ICFinancialFlow>)object {
    @synchronized (self) {
        [self takeMoney:[object giveMoney]];
    }
}

- (void)takeMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money += money;
    }
}

- (NSUInteger)giveMoney {
    @synchronized (self) {
        NSUInteger money = self.money;
        self.money = 0;
        
        return money;
    }
}
    
@end

