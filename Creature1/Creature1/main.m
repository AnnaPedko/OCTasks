//
//  main.m
//  Creature1
//
//  Created by Anna P. on 21.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICCreature.h"
#import "ICMaleCreature.h"
#import "ICFemaleCreature.h"
#import "ICRandomInRange.h"

#import "NSObject+ICInitObject.h"
#import "NSArray+ICExtensions.h"
#import "NSObject+ICExtensions.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        static const NSRange genderRange = {0, 1};
        NSArray *creatures = [NSArray objectsWithCount:4 factory:^{
            NSUInteger randomValue =ICRandomInRange(genderRange);
            id creature = !(randomValue) ? [ICFemaleCreature object] : [ICMaleCreature object];
            [creature addChildren:[ICCreature objectsWithCount:2]];
            
            return creature;
        }];
        
        for (ICCreature *creature in creatures) {
            [creature performGenderSpecificOperation];
        }
        NSLog(@"%lu", (unsigned long)[creatures count]);
    }
    
    return 0;
}
