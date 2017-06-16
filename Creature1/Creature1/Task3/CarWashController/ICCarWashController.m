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

@end

@implementation ICCarWashController

- (void)dealloc {
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

- (void)createCarQueue:(NSArray *)cars{
    for (ICCar *car in cars) {
        [self.carQueue enqueue:car];
    }
}

- (void)createWasherQueue:(NSArray *)washers {
    for (ICEmployee *washer in washers) {
        [self.washerQueue enqueue:washer];
    }
}

- (void)performWorkWithWasher:(ICEmployee *)washer {
    @synchronized (self) {
        if(![self.carQueue isEmpty]) {
            [washer.queue enqueue:[self.carQueue dequeue]];
            
            if (![washer.queue isEmpty]) {
                [washer workWithObject:[washer.queue dequeue]];
            }
        }
    }
}

- (void)employeeDidFinishWork:(ICEmployee *)washer {
    @synchronized (self) {
        [self.washerQueue enqueue:washer];
        [self performWorkWithWasher:washer];
    }
}

- (void)washCars {
    @synchronized (self) {
        for (NSUInteger i = 0; i < [self.washerQueue count]; i++) {
            ICEmployee *washer = [self.washerQueue dequeue];
            if (washer && ICObjectFree == washer.state ) {
                [self performWorkWithWasher:washer];
            }
        }
    }
}

@end