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
@property (nonatomic, retain)   ICQueue *carQueue;
@property (nonatomic, retain)   ICCarWashController *washController;

@end

@implementation ICCarWash

- (void)dealloc {
    self.washers = nil;
    self.director = nil;
    self.accountant = nil;
    self.carQueue = nil;
    self.washController = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self.washers = [NSMutableArray object];
    self.carQueue = [ICQueue object];
    self.washController = [ICCarWashController object];

    [self prepareEnterprise];
    
    return self;
}

- (void)prepareEnterprise {
    [self.washers addObjectsFromArray:[ICWasher objectsWithCount:ICDefaultCountOfWashers]];
    self.accountant = [ICAccountant object];
    self.director = [ICDirector object];
    
    for (ICWasher *washer in self.washers) {
        [washer addObserver:self.accountant];
        [washer addObserver:self.washController];
    }
    
    [self.accountant addObserver:self.director];
}

- (id<ICFinancialFlow>)freeEmployee:(NSArray *)employees {
    return [[employees filteredArrayWithBlock:^BOOL(ICEmployee *employee) {
            return employee.state == ICObjectFree;}] firstObject];
    }

- (void)washCars:(NSArray *)cars {
    [self.washController createCarQueue:cars];
    [self.washController createWasherQueue:self.washers];
    [self.washController washCars];
}

- (void)employeeDidBecomeBusy:(id)employee {
    NSLog(@"%@ became busy", employee);
}

@end
