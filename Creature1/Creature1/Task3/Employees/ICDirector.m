//
//  ICDirector.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICDirector.h"
#import "ICAccountant.h"

const static NSUInteger defaultExperience = 5;

@implementation ICDirector
@synthesize money;

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.experience = defaultExperience;
        self.state = ICObjectFree;
    }
    
    return self;
}

- (void)performObjectSpecificOperation:(id)object {
    
}

- (void)processObject:(ICEmployee *)object {
    [super processObject:object];
    object.state = ICObjectFree;
    
}

@end
