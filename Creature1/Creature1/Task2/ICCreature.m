//
//  Creature.m
//  Creature1
//
//  Created by Anna P. on 21.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCreature.h"
#import "ICRandomInRange.h"

#import "NSString+ICGenerateRandomString.h"
#import "NSObject+ICExtensions.h"

@interface ICCreature()
@property (nonatomic, retain) NSMutableArray *mutableChildren;

@end

static const NSRange ICWeightRange = {45, 100};
static const NSRange ICAgeRange = {3, 60};

@implementation ICCreature
@dynamic children;

#pragma mark - 
#pragma mark Initializer and Dealloc Methods

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
        self.weight = ICRandomInRange(ICWeightRange);
        self.age = ICRandomInRange(ICAgeRange);
        self.mutableChildren = [NSMutableArray object];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Public Methods

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

- (void)addChildren:(NSArray *)children {
    return [self.mutableChildren addObjectsFromArray:children];
}

- (void)addChild:(ICCreature *)child {
    if (child) {
        [self.mutableChildren addObject:child];
    }
}

- (void)removeChild:(ICCreature *)child {
    [self.mutableChildren removeObject:child];
}

- (void) removeChildren:(NSArray *)children {
    [self.mutableChildren removeObjectsInArray:children];
}

- (void)sayHello {
    NSLog(@"%@ Hello", self.name);
    for (ICCreature *child in self.children) {
        [child sayHello];
    }
}

- (void)performGenderSpecificOperation {
}

@end
