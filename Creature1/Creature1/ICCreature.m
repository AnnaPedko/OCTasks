//
//  Creature.m
//  Creature1
//
//  Created by Anna P. on 21.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCreature.h"

@implementation ICCreature

- (instancetype)initWithSex:(ICCreatureSex)sex name:(NSString *)name weight:(unsigned int)weight age:(unsigned int)age {
    self = [super init];
    if (self) {
        _sex = sex;
        _name = [name copy];
        _weight = weight;
        _age = age;
        _children = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)children {
    return [_children copy];
}

- (void)goFight {
    NSLog(@"%@ %s", _name, "go fight");
}

- (ICCreature *)giveBirth {
    NSLog(@"Child wos born");
    return [[ICCreature alloc] initWithSex:ICMale
                               name:[_name stringByAppendingString:@"child"]
                               weight:_weight/ 2
                               age:_age/ 2];
}

- (void)addChild:(ICCreature *)child {
    [_children addObject:child];
}

- (void)removeChild:(ICCreature *)child {
    [_children removeObject:child];
}

- (void)sayHello {
    NSLog(@"%@ Hello", _name);
    for(ICCreature *child in _children){
        [child sayHello];
    }
}

@end
