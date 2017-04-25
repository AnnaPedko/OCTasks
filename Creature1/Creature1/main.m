//
//  main.m
//  Creature1
//
//  Created by Anna P. on 21.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICCreature.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray *creatures = [[[NSMutableArray alloc] init] autorelease];
        const NSUInteger creatureCount = 10;
        
        for (NSUInteger i = 0; i < creatureCount; ++i) {
            ICCreature *creature = [[[ICCreature alloc] init] autorelease];
            [creatures addObject:creature];
        }
        
        NSLog(@"%lu", (unsigned long)[creatures count]);
    }
    
    return 0;
}
