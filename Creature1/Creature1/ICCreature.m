//
//  Creature.m
//  Creature1
//
//  Created by Anna P. on 21.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCreature.h"
#import "ICCreature+ICGenerateRandomNumber.h"
#import "ICCreature+ICGenerateRandomString.h"

@interface ICCreature()

@property (nonatomic, assign) NSMutableArray *mutableChildren;

@end

@implementation ICCreature

@dynamic children;

#pragma mark - 
#pragma mark Public Methods

- (instancetype)initWithName:(NSString *)name
                        weight:(NSUInteger)weight
                           age:(NSUInteger)age
    {
    self = [super init];
    if (self) {
        self.name = name;
        self.weight = weight;
        self.age = age;
        self.mutableChildren = [[[NSMutableArray alloc] init] autorelease];
    }
    
    return self;
}

- (instancetype)init {
   return [self initWithName:[self generateRandomStringWithLength:5]
              weight:[self generateRandomNumberBetweenMin:40 max:80]
                 age:[self generateRandomNumberBetweenMin:20 max:50]];
}

-(void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
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

@end
