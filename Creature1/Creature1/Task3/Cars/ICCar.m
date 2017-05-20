//
//  ICCar.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCar.h"
#import "NSObject+ICInitObject.h"

const static NSUInteger defaultMoney = 200;

@implementation ICCar
@synthesize state;
@synthesize salary;
@synthesize money;
@synthesize room;

- (void)dealloc {
    self.room = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.money = defaultMoney;
        self.state = ICObjectFree;
        self.room = [ICRoom object];
    }
    
    return self;
}

- (NSUInteger)giveMoney {
    NSUInteger carMoney = self.money;
    self.money = 0;
    
    return carMoney;
}

@end
