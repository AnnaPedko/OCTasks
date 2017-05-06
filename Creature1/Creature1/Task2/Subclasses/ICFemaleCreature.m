//
//  ICFemaleCreature.m
//  Creature1
//
//  Created by Anna P. on 25.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICFemaleCreature.h"
#import "NSObject+ICInitObject.h"

@implementation ICFemaleCreature

- (ICCreature *)giveBirth {
    NSLog(@"Child was born");
    return [ICCreature object];
}

- (void)performGenderSpecificOperation {
    [self giveBirth];
}

@end
