//
//  ICFemaleCreature.m
//  Creature1
//
//  Created by Anna P. on 25.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICFemaleCreature.h"
#import "NSNumber+ICGenerateRandomNumber.h"
#import "NSString+ICGenerateRandomString.h"

@implementation ICFemaleCreature

- (ICCreature *)giveBirth {
    NSLog(@"Child wos born");
    return [[[ICCreature alloc] initWithName:[self.name stringByAppendingString:@"child"]
                                      weight:[NSNumber generateRandomNumberBetweenMin:2 max:5]
                                         age:[NSNumber generateRandomNumberBetweenMin:0 max:2]] autorelease];
}

- (void)performGenderSpecificOperation {
    [self giveBirth];
}

@end
