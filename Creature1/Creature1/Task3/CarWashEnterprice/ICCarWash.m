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
#import "ICAccountant.h"
#import "ICDirector.h"

#import "NSArray+ICExtensions.h"
#import "NSObject+ICExtensions.h"

//const static NSUInteger ICDefaultMoney = 400;
const static NSUInteger ICDefaultCountOfWashers = 3;

@interface ICCarWash ()
@property (nonatomic, retain)   NSMutableArray  *washers;
@property (nonatomic, retain)   ICDirector  *director;
@property (nonatomic,retain)    ICAccountant  *accountant;
@end

@implementation ICCarWash

- (void)dealloc {
    self.washers = nil;
    [super dealloc];
}

- (instancetype)init {
    
    self.washers = [NSMutableArray object];
    [self prepareEnterprise];
    
    return self;
}

- (void)prepareEnterprise {
    [self.washers addObjectsFromArray:[ICWasher objectsWithCount:ICDefaultCountOfWashers]];
    self.accountant = [ICAccountant object];
    self.director = [ICDirector object];
    
    for (ICWasher *washer in self.washers) {
        [washer addObserver:self.accountant];
    }
    
    [self.accountant addObserver:self.director];
}

- (void)washCars:(NSArray *)cars {
    for (ICCar* car in cars) {
        ICWasher *washer = self.washers[0];
        [washer processObject:car];
        NSLog (@"Profit = %lu",self.director.money);
    }
}

@end
