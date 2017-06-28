//
//  ICWasher.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICWasher.h"
#import "ICCar.h"
#import "ICCarWash.h"

const static NSUInteger ICDefaultExperience = 2;

@implementation ICWasher

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.experience = ICDefaultExperience;
    }
    
    return self;
}

#pragma mark -
#pragma mark Overload Methods

- (void)finishProcessingObject:(ICCar *)object {
    NSLog(@" %@ became clean", object);
    NSLog(@"---- Money %@  =  %lu" , self, self.money);

    object.state = ICCarClean;
}

- (void)performObjectSpecificOperation:(id<ICFinancialFlow>)car {
    @synchronized (self) {
        [self washCar:car];
    }
}

#pragma mark -
#pragma mark Private methods

- (void)washCar:(ICCar *)car {
    
}

@end
