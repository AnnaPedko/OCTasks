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
#import "ICQueue.h"
#import "ICCarWashController.h"

#import "NSArray+ICExtensions.h"
#import "NSObject+ICExtensions.h"

const static NSUInteger ICDefaultCountOfWashers = 3;

@interface ICCarWash ()
@property (nonatomic, retain)   NSMutableArray  *washers;
@property (nonatomic, retain)   ICDirector  *director;
@property (nonatomic, retain)   ICAccountant  *accountant;
@property (nonatomic, retain)   ICCarWashController *washController;

@end

@implementation ICCarWash

- (void)dealloc {
    for (id washer in self.washers) {
        [washer removeObservers];
    }
    
    [self.accountant removeObserver:self.director];

    self.washers = nil;
    self.director = nil;
    self.accountant = nil;
    self.washController = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.washController = [ICCarWashController object];

    [self prepareEnterprise];
    
    return self;
}

- (void)prepareEnterprise {
    id accountant = [ICAccountant object];
    self.accountant = accountant;
    id director = [ICDirector object];
    self.director = director;
    id washers = [NSMutableArray object];
    self.washers = washers;
    
    [washers addObjectsFromArray:[NSArray objectsWithCount:ICDefaultCountOfWashers factory:^id{
        id washer = [ICWasher object];
        [washer addObservers:@[accountant, self]];
        
        return washer;
    }]];
    [accountant addObserver:director];
}

- (id<ICFinancialFlow>)freeEmployee:(NSArray *)employees {
    return [[employees filteredArrayWithBlock:^BOOL(ICEmployee *employee) {
            return employee.state == ICObjectFree;}] firstObject];
    }

- (void)washCars:(NSArray *)cars {
    id washController = self.washController;
    [washController addWasher:[self freeEmployee:self.washers]];
    for (ICCar *car in cars) {
        [washController washCar:car];
    }
    
}

@end
