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
} ICCreatureSex;

@interface ICCreature : NSObject {
    NSMutableArray *_children;
}

@property (nonatomic, assign, readonly)     ICCreatureSex   sex;
@property (atomic, retain, readwrite)       NSString        *name;
@property (nonatomic, assign, readwrite)    unsigned        weight;
@property (nonatomic, assign, readonly)     unsigned        age;
@property (nonatomic,retain, readonly)      NSArray         *children;

- (instancetype)initWithSex:(ICCreatureSex)sex name:(NSString *)name weight:(unsigned)weight age:(unsigned)age;
- (void)goFight;
- (ICCreature *)giveBirth;
- (void)addChild:(ICCreature *)child;
- (void)removeChild:(ICCreature *)child;
- (void)sayHello;

@end
