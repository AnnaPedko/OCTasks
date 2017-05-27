//
//  NSArray+ICExtension.h
//  Creature1
//
//  Created by Anna P. on 05.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ICExtensions)

+ (NSArray *)objectsWithCount:(NSUInteger)count factory:(id(^)(void))objectCreator;
- (instancetype)objectsWithClass:(Class)cls;


@end
