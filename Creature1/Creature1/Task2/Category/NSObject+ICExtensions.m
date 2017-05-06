//
//  NSObject+ICExtension.m
//  Creature1
//
//  Created by Anna P. on 05.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "NSObject+ICExtensions.h"
#import "NSObject+ICInitObject.h"

@implementation NSObject (ICExtensions)

+ (NSArray *)objectsWithCount:(NSUInteger) count {
    NSMutableArray *creatures = [NSMutableArray object];
    for (NSUInteger index = 0; index < count; index++) {
        [creatures addObject:[self object]];
    }
    
    return [[creatures copy] autorelease];
}

@end
