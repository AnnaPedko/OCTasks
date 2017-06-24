//
//  ICCar.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCar.h"

#import "NSObject+ICExtensions.h"

const static NSUInteger ICDefaultMoney = 200;

@implementation ICCar
@synthesize money;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.money = ICDefaultMoney;
        self.state = ICCarDirty;
    }
    
    return self;
}

- (NSUInteger)giveMoney {
    @synchronized (self) {
        NSUInteger carMoney = self.money;
        self.money = 0;
        
        return carMoney;
    }
}

@end
