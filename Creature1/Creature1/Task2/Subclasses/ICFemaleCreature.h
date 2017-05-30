//
//  ICFemaleCreature.h
//  Creature1
//
//  Created by Anna P. on 25.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCreature.h"

#import "NSObject+ICExtensions.h"

@interface ICFemaleCreature : ICCreature

- (ICCreature *)givingBirthToChild;
- (void)performGenderSpecificOperation;

@end
