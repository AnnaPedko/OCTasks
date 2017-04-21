//
//  Creature.m
//  Creature1
//
//  Created by Anna P. on 21.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCreature.h"

@implementation ICCreature

-(instancetype)initWithSex:(ICCreatureSex)sex name:(NSString *)name weight:(unsigned int)weight age:(unsigned int)age{
    self = [super init];
    if (self){
        _sex = sex;
        _name = [name copy];
        _weight = weight;
        _age = age;
        _children = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
