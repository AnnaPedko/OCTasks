//
//  main.m
//  Creature1
//
//  Created by Anna P. on 21.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICCreature.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *creatures = [[NSMutableArray alloc] init];
        
        for(int i = 0; i < 10; ++i){
            unsigned randomVariable = arc4random_uniform(1000) + 1;
            ICCreatureSex sex =ICMale;
            NSString *name = @"Ivan";
            if(0 == randomVariable%2){
                sex = ICFemale;
                name = @"Olga";
            }
            ICCreature *creature = [[ICCreature alloc]
                                      initWithSex:sex
                                      name:[NSString stringWithFormat:@"%@%u",name, randomVariable]
                                      weight:60 + randomVariable
                                      age:30 + randomVariable];
            [creature addChild:[creature giveBirth]];
            [creatures addObject:creature];
        }
        for(ICCreature *creature in creatures){
            if([creature sex] == ICFemale){
                [creature giveBirth];
            } else {
                [creature goFight];
            }
            [creature sayHello];
            NSLog(@"child count %lu", (unsigned long)creature.children.count);
        }
        NSLog(@"%lu",(unsigned long)[creatures count]);
    }
    
    return 0;
}
