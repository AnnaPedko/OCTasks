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

@implementation ICWasher

@synthesize condition;

- (instancetype) init {
    self = [super init];
    if (self) {
        self.money = 0;
        self.salary = 0;
        self.experience = 2;
        self.condition = false;
    }
    
    return self;
}

- (void) dealloc {
    [super dealloc];
}

- (void) takeMoney:(ICCar *)car {
    self.money += car.money;
    car.money = 0;
}

- (void) performEmployeeSpecificOperation:(ICCar *) car {
    if (!car.isClear) {
        [self takeMoney:car];
        car.condition = true;
        self.condition = true;
    }
}



@end
