//
//  Creature.m
//  Creature1
//
//  Created by Anna P. on 21.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCreature.h"
#import "NSString+ICGenerateRandomString.h"
#import "ICRandomInRange.h"

@interface ICCreature()

@property (nonatomic, assign) NSMutableArray *mutableChildren;

@end

@implementation ICCreature

@dynamic children;

#pragma mark - 
#pragma mark Public Methods

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString generateRandomStringWithLength:5];
        self.weight = ICRandomInRange(NSMakeRange(45, 100));
        self.age = ICRandomInRange(NSMakeRange(3, 60));
        self.mutableChildren = [[[NSMutableArray alloc] init] autorelease];
    }
    
    return self;
}

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

- (void)addChildren:(NSArray *)children {
    return [self.mutableChildren addObjectsFromArray:children];
    
}

- (void)addChild:(ICCreature *)child {
    [self.mutableChildren addObject:child];
}

- (void)removeChild:(ICCreature *)child {
    [self.mutableChildren removeObject:child];
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
