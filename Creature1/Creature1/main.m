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
        ICCreature *creature = [[ICCreature alloc] initWithSex:ICMale name:@"Ivan" weight:60 age:30];
        NSLog(@"%@", [creature class]);
    }
    return 0;
}
