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

- (instancetype)init {
    self = [super init];
    if (self) {
        self.experience = ICDefaultExperience;
    }
    
    return self;
}

- (void)washCar:(ICCar *)car {
    [self finishProcessObject:car];
}

- (void)finishProcessObject:(ICCar *)object {
    NSLog(@" %@ became clean", object);
    object.state = ICCarClean;
}

- (void)performObjectSpecificOperation:(id<ICFinancialFlow>)car {
    [self washCar:car];
}

@end
