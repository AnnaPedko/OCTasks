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
    ICCreatureSex _sex;
    NSString *_name;
    unsigned _weight;
    unsigned _age;
    NSMutableArray *_children;
}
@property(nonatomic, readonly)ICCreatureSex sex;

-(instancetype)initWithSex:(ICCreatureSex)sex name:(NSString *)name weight:(unsigned)weight age:(unsigned)age;
-(void)goFight;
-(ICCreature *)giveBirth;
-(void)addChild:(ICCreature *)child;
-(void)removeChild:(ICCreature *)child;
-(void)sayHello;

@end
