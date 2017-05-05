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
#import "NSObject+ICInitObject.h"
#import "NSArray+ICExtension.h"
#import "NSObject+ICExtension.h"
#import "ICRandomInRange.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        
        NSArray *creatures = [NSArray objectsWithCount:4 factory:^{
            NSUInteger randomValue =ICRandomInRange(NSMakeRange(1, 10));
            id creature = !(randomValue % 2) ? [ICFemaleCreature object] : [ICMaleCreature object];
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
