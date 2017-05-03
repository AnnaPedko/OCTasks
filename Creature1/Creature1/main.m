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

#import "ICAccountant.h"
#import "ICCar.h"
#import "ICWasher.h"
#import "ICCarWash.h"
#import "ICDirector.h"
#import "ICEmployee.h"

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
    
    @autoreleasepool {
        ICEmployee *washer = [ICWasher object];
        ICAccountant *accountant = [ICAccountant object];
        ICDirector *director = [ICDirector object];
        ICCar *car = [ICCar object];
        ICCarWash *carWash = [ICCarWash object];
        
        [washer performEmployeeSpecificOperation:car];
        [carWash takeMoney:washer];
        [accountant takeMoney:carWash];
        [accountant performEmployeeSpecificOperation:washer];
        [accountant performEmployeeSpecificOperation:accountant];
        [accountant performEmployeeSpecificOperation:director];
        [director takeMoney: accountant];
        
        NSLog(@"Director money = %lu",[director money]);
        
        
    }
    
    return 0;
}
