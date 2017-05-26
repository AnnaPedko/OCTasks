//
//  NSObject+ICInitObject.m
//  Creature1
//
//  Created by Anna P. on 26.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "NSObject+ICInitObject.h"

@implementation NSObject (ICInitObject)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

@end
