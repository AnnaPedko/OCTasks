//
//  ICDispatch.m
//  Creature1
//
//  Created by Anna P. on 17.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICDispatch.h"

#import "NSObject+ICExtensions.h"

@implementation ICDispatch

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.processingObjects = nil;
    self.handlers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.processingObjects = [ICQueue object];
        self.handlers = [NSMutableArray object];
    }
    
    return self;
}

- (void)performProcessingWithObject:(id<ICFinancialFlow>)object {
    [object workWithObject:[self.processingObjects dequeue]];
}

- (void)employeeDidFinishWork:(id<ICFinancialFlow>)object {
    if (![self.processingObjects isEmpty]) {
        [self performProcessingWithObject:object];
        
    }
}
- (void)employeeDidBecomeBusy:(id<ICFinancialFlow>)employee {

}

@end
