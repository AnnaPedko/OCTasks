//
//  NSArray+ICExtension.m
//  Creature1
//
//  Created by Anna P. on 05.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "NSArray+ICExtensions.h"

@implementation NSArray (ICExtension)

+ (NSArray *)objectsWithCount:(NSUInteger)count factory:(id(^)(void))objectCreator {
    NSMutableArray *creatures = [NSMutableArray object];
    for (NSUInteger index = 0; index < count; ++index) {
        [creatures addObject:objectCreator()];
    }
    
    return [self arrayWithArray:creatures];
}

/*- (instancetype)objectsWithClass:(Class)cls {
    NSPredicate *predicate = [NSPredicate predicateWithBlock: ^BOOL(id object, NSDictionary *bindings) {
        return [object isMemberOfClass:cls];
    }];
    
    return [self filteredArrayUsingPredicate:predicate];
}*/

- (instancetype)objectsWithClass:(Class)cls {
        return [self filteredArrayWithBlock:^BOOL(id cls) {
            return [self isMemberOfClass:cls];
        }];
    
}

- (instancetype)filteredArrayWithBlock:(BOOL(^)(id object))block {
    if (!block) {
        return nil;
    }
    NSPredicate *predicate = [NSPredicate predicateWithBlock: ^BOOL(id object, NSDictionary *bindings) {
        return block(object);
    }];
    
    return [self filteredArrayUsingPredicate:predicate];
}


@end