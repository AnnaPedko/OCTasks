//
//  ICDirector.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICDirector.h"
#import "ICAccountant.h"

@implementation ICDirector

@synthesize condition;

- (instancetype) init {
    self = [super init];
    if (self) {
        self.money = 0;
        self.salary = 0;
        self.experience = 4;
    }
    return self;
}

- (void) dealloc {
    [super dealloc];
}

- (void) takeMoney:(ICAccountant *)accountant {
    if (accountant.isReady) {
        self.money += accountant.money;
        accountant.money = 0;
        accountant.condition = false;
        self.condition = true;
    }
}


@end
