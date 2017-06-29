//
//  ICCarsGenerator.h
//  Creature1
//
//  Created by Anna P. on 30.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICCar.h"

#import "NSArray+ICExtensions.h"

@interface ICCarsGenerator : NSObject
@property(nonatomic, retain) NSTimer    *timer;

- (instancetype)initWithTimer:(NSTimer *)timer;
- (NSArray *)timerDidFire:(NSTimer *)timer;

@end
