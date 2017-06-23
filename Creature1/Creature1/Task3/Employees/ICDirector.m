//
//  ICDirector.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICDirector.h"
#import "ICAccountant.h"

const static NSUInteger ICDefaultExperience = 5;

@implementation ICDirector

@synthesize money;

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
#pragma mark Overload methods

- (void)finishProcessingObject:(ICEmployee *)object {
    NSLog(@" %@ finishProcessObject %@", self, object);
    object.state = ICObjectFree;
}

- (void)finishWork {
    NSLog(@"%@ finish work", self);
    self.state = ICObjectFree;
}

- (void)performObjectSpecificOperation:(id)object {
    @synchronized (self) {
        [self calculateProfit];
    }
}

#pragma mark -
#pragma mark Private methods

- (void)calculateProfit {
    self.salary = self.money;
    NSLog(@"Money = %lu",self.salary);
}

@end
