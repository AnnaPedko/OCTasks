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
#import "NSTimer+ICExtensions.h"

static NSTimeInterval   ICTimerInterval = 20;
static NSUInteger ICCarNumber = 5;

@interface ICCarWash ()
@property (nonatomic, retain)   ICCarWashController *washController;
@property (nonatomic, retain)   NSTimer             *timer;

@end

@implementation ICCarWash
- (void)dealloc {
    self.washController = nil;
    self.timer = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.washController = [ICCarWashController object];
    [self prepareTimer];

    return self;
}


- (void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        [_timer invalidate];
        _timer = timer;
    }
}

- (void)prepareTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:ICTimerInterval
                                              weakTarget:self
                                                selector:@selector(generateCars)
                                                userInfo:nil
                                                 repeats:YES];

}

- (void)generateCars {
    NSArray *cars = [ICCar objectsWithCount:ICCarNumber];
    [self performSelectorInBackground:@selector(washCars:) withObject:cars];
}

- (void)washCars:(NSArray *)cars {
    [self.washController washCars:cars];
}

@end
