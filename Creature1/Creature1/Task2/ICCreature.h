//
//  Creature.h
//  Creature1
//
//  Created by Anna P. on 21.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICCreature : NSObject
@property (nonatomic, copy) NSString    *name;
@property (nonatomic, assign)   NSUInteger  weight;
@property (nonatomic, assign)   NSUInteger  age;
@property (nonatomic, readonly) NSArray *children;

- (void)addChild:(ICCreature *)child;
- (void)addChildren:(NSArray *)children;
- (void)removeChildren:(NSArray *)children;
- (void)removeChild:(ICCreature *)child;
- (void)sayHello;
- (void)performGenderSpecificOperation;

@end
