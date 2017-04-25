//
//  ICCreature+generateRandomNumber.m
//  Creature1
//
//  Created by Anna P. on 24.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "NSNumber+ICGenerateRandomNumber.h"

@implementation NSNumber (ICGenerateRandomNumber)

+ (NSUInteger)generateRandomNumberBetweenMin:(NSUInteger)min max:(NSUInteger)max {
    return  (arc4random() % (max - min + 1)) + min;
}

@end
