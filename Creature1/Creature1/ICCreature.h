//
//  Creature.h
//  Creature1
//
//  Created by Anna P. on 21.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ICMale,
    ICFemale
} ICCreatureGender;

@interface ICCreature : NSObject {
}

@property (nonatomic, assign)               ICCreatureGender    gender;
@property (nonatomic, retain)               NSString            *name;
@property (nonatomic, assign)               NSUInteger          weight;
@property (nonatomic, assign)               NSUInteger          age;
@property (nonatomic, readonly)             NSArray             *children;

- (instancetype)initWithGender:(ICCreatureGender)gender
                          name:(NSString *)name
                        weight:(NSUInteger)weight
                           age:(NSUInteger)age;
- (void)goFight;
- (ICCreature *)giveBirth;
- (void)addChild:(ICCreature *)child;
- (void)removeChild:(ICCreature *)child;
- (void)sayHello;

@end
