//
//  ICCreature+generateRandomNumber.h
//  Creature1
//
//  Created by Anna P. on 24.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (ICGenerateRandomNumber)

+ (NSUInteger)generateRandomNumberBetweenMin:(NSUInteger)min max:(NSUInteger)max;

@end