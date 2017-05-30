//
//  NSObject+ICExtension.m
//  Creature1
//
//  Created by Anna P. on 05.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "NSObject+ICExtensions.h"
#import "NSArray+ICExtensions.h"

@implementation NSObject (ICExtensions)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    NSArray *objects = [NSArray objectsWithCount:count factory:^{
        return [self object];}];
    
    return objects ;
}



@end
