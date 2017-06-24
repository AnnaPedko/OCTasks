//
//  ICQueue.h
//  Creature1
//
//  Created by Anna P. on 14.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+ICExtensions.h"

@interface ICQueue : NSObject
@property (nonatomic, retain)   NSArray  *queue;
@property (nonatomic, assign)   BOOL    isEmpty;
@property (nonatomic, assign)   NSUInteger  count;

- (void)enqueue:(id)object;
- (id)dequeue;
- (void)removeObject:(id)object;

@end
