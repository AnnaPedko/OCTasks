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

const static NSUInteger ICDefaultCountOfWashers = 3;

@interface ICCarWash ()
@property (nonatomic, retain)   NSMutableArray  *washers;
@property (nonatomic, retain)   ICDirector  *director;
@property (nonatomic, retain)   ICAccountant  *accountant;
@property (nonatomic, retain)   NSMutableArray   *mutableCars;
@end

@implementation ICCarWash

- (void)dealloc {
    self.washers = nil;
    self.director = nil;
    self.accountant = nil;
    self.mutableCars = nil;
    
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
        [washer addObserver:self];
    }
    
    [self.accountant addObserver:self.director];
}

- (id<ICFinancialFlow>)freeEmployee:(NSArray *)employees {
    return [[employees filteredArrayWithBlock:^BOOL(ICEmployee *employee) {
        
             return employee.state == ICObjectFree;
        }]firstObject];
    }

- (void)washCars:(NSArray *)cars {
    for (ICCar* car in cars) {
        ICWasher *washer = [self freeEmployee:self.washers];
        if (washer) {
            [washer processObject:car];
        } else {
            [self.mutableCars addObject:car];
        }
        
        NSLog (@"Profit = %lu",self.director.money);
    }
}

- (void)employeeDidFinishWork:(id)employee {
    if (self.mutableCars.count > 0) {
        ICCar *dirtyCar = [self.mutableCars firstObject];
        [self.mutableCars removeObject:dirtyCar];
        [employee processObject:dirtyCar];
    }
}

- (void)employeeDidBecomeBusy:(id)employee {
    NSLog(@"%@ became busy", employee);
}

@end
