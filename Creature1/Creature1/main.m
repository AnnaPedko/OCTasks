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

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray *creatures = [NSMutableArray object];
        const NSUInteger creatureCount = 10;
        
        for (NSUInteger i = 0; i < creatureCount; ++i) {
            ICCreature *maleCreature = [ICMaleCreature object];
            ICCreature *femaleCreature = [ICFemaleCreature object];
            [creatures addObject:maleCreature];
            [creatures addObject:femaleCreature];
        }
        
        for (ICCreature *creature in creatures) {
            [creature performGenderSpecificOperation];
        }
        
        NSLog(@"%lu", (unsigned long)[creatures count]);
    }
    
    return 0;
}
