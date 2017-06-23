//
//  ICCarWashController.m
//  Creature1
//
//  Created by Anna P. on 15.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCarWashController.h"
#import "ICEmployee.h"
#import "ICCar.h"
#import "ICWasher.h"

@interface ICCarWashController () <ICEmployeeObserver>
@property (nonatomic, retain)   ICQueue *washerQueue;
@property (nonatomic, retain)   ICQueue *carQueue;
@property (nonatomic, retain)   NSMutableSet    *washers;

@end

@implementation ICCarWashController

- (void)dealloc {
    for (id washer in self.washers) {
        [washer removeObserver:self];
    }
    
    self.washerQueue = nil;
    self.carQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.washerQueue = [[ICQueue new] autorelease];
        self.carQueue = [[ICQueue new] autorelease];
    }
    
    return self;
}

- (void)addWasher:(id)washer {
    @synchronized (self) {
        id washers = self.washers;
        if (![washers containsObject:washer]) {
            [washers addObject:washer];
            
            [washer addObserver:self];
            [self.washerQueue enqueue:washer];
        }
    }
}

- (void)removeWasher:(id)washer {
    @synchronized (self) {
        [self.washers removeObject:washer];
        [washer removeObserver:self];
        
        [self.washerQueue dequeue];
    }
}

- (void)washCar:(ICCar  *)car {
    ICWasher *washer = [self.washerQueue dequeue];
    if (washer) {
        [washer processObject:car];
    } else {
        [self.carQueue enqueue:car];
    }
}

#pragma mark - 
#pragma mark ICEmployeeObserver methods

- (void)employeeDidFinishWork:(ICEmployee *)washer {
    id car = [self.carQueue dequeue];
    if (car) {
        [washer processObject:car];
    } else {
        [self.washerQueue enqueue:washer];
    }
}

@end
