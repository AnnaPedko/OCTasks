//
//  ICCarWash.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCarWash.h"
#import "ICCar.h"
#import "ICWasher.h"

@interface ICCarWash()

@property (nonatomic, assign) NSMutableArray *mutableCarGarage;

@end

@implementation ICCarWash

@synthesize condition;

- (instancetype) init {
    self = [super init];
    if (self) {
        self.money = 400;
        self.price = 200;
    }
    return self;
    
}

- (void) dealloc {
    self.mutableCarGarage = nil;
    
    [super dealloc];
}

- (void) addCar:(ICCar *)car {
    [self.mutableCarGarage addObject:car];
}

- (NSArray *)carGarage {
    return [[self.mutableCarGarage copy] autorelease];
}

- (void) takeMoney:(ICWasher *)washer {
    if (washer.condition) {
        self.money += self.price;
        washer.money -= self.price;
        washer.condition = false;
        self.condition= true;
    }
}


@end
