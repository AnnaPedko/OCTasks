//
//  ICCarsGenerator.m
//  Creature1
//
//  Created by Anna P. on 30.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCarsGenerator.h"

#import "NSTimer+ICExtensions.h"




@implementation ICCarsGenerator

- (void)dealloc {
    [self.timer invalidate];
    
    [super dealloc];
}

- (instancetype)initWithTimer:(NSTimer *)timer {
    self = [super init];
    self.timer = timer;
    
    return self;
}

- (NSArray *)timerDidFire:(NSTimer *)timer {
    return [self performSelector:@selector(generateCars) withObject:timer];
}

- (NSArray *)generateCars {
    return [ICCar objectsWithCount:ICCarNumber];
}

@end
