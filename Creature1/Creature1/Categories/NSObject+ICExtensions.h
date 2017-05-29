//
//  NSObject+ICExtension.h
//  Creature1
//
//  Created by Anna P. on 05.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSArray+ICExtensions.h"

@interface NSObject (ICExtensions)

+ (instancetype)object;
+ (NSArray *)objectsWithCount:(NSUInteger) count;

@end
