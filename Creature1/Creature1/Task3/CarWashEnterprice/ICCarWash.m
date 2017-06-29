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

@interface ICCarWash ()
@property (nonatomic, retain)   ICCarWashController *washController;

@end

@implementation ICCarWash
- (void)dealloc {
    self.washController = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.washController = [ICCarWashController object];
    
    return self;
}

- (void)washCars {
    [self.washController washCars];
}

@end
