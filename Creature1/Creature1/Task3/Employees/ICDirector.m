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

- (instancetype)init {
    self = [super init];
    if (self) {
        self.experience = ICDefaultExperience;
    }
    
    return self;
}

- (void)finishProcessObject:(ICEmployee *)object {
    NSLog(@" %@ finishProcessObject %@", self, object);
    object.state = ICObjectFree;
}

- (void)finishWork {
    self.state = ICObjectFree;
}

- (void)performObjectSpecificOperation:(id)object {
    self.salary = self.money;
    [self finishProcessObject:object];
}

@end
