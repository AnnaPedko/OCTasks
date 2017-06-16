//
//  ICEmployee.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICEmployee.h"

@interface ICEmployee ()
- (void)backgroundProcessingObject:(id<ICFinancialFlow>)object;
- (void)mainProcessingObject:(id<ICFinancialFlow>)object;
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

- (void)assignThreadForProcessObject:(id)object {
    [self performSelectorInBackground:@selector(backgroundProcessingObject:) withObject:object];
    }

- (void)backgroundProcessingObject:(id<ICFinancialFlow>)object {
        NSLog(@"Background %@, object = %@", self, object);
    
        [self processObject:object];
    
        [self performSelectorOnMainThread:@selector(mainProcessingObject:)
                               withObject:object
                            waitUntilDone:NO];
}

- (void)mainProcessingObject:(id<ICFinancialFlow>)object {
    NSLog(@"Main %@, object = %@", self,object);
    
    [self sleep];

    [self finishProcessObject:object];
    [self finishWork];
}

- (void)employeeReadyForProcessing:(id)employee {
    @synchronized (self) {
        [self.queue enqueue:employee];
        
        NSLog(@"%@ ready for processing", employee);
        [self workWithObject:[self.queue dequeue]];
    }
}

- (void)workWithObject:(id)object {
    [self assignThreadForProcessObject:object];
}

- (void)sleep {
    usleep((uint32)arc4random_uniform(1000 * 1000 * ICSleepDuration));
}

- (void)employeeDidBecomeBusy:(id)employee {
    NSLog(@" %@ became busy", employee);
}

- (void)finishProcessObject:(id)object {
}

- (void)finishWork {
    NSLog(@"%@ finish work", self);
    @synchronized (self) {
        self.state = ICObjectReadyForProcessing;
    }
}

- (void)performObjectSpecificOperation:(id)object {
};

#pragma mark -
#pragma Public Methods

- (void)processObject:(id<ICFinancialFlow>)object {
    @synchronized (self) {
        if (ICObjectFree == self.state) {
            self.state = ICObjectBusy;
            NSLog(@"%@ became process object %@",self, object);
            
            [self takeMoneyFromObject:object];
            [self performObjectSpecificOperation:object];
            NSLog(@" %@ money = %lu" , self, self.money);
        }
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

