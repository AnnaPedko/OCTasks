//
//  ICMaleCreature.m
//  Creature1
//
//  Created by Anna P. on 26.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICMaleCreature.h"

@implementation ICMaleCreature

- (void)goFight {
    NSLog(@"%@ %s", self.name, "go fight");
}

- (void)performGenderSpecificOperation {
    [self goFight];
}

@end
