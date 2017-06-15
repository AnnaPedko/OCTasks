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
@property (nonatomic, retain)   NSMutableArray  *queue;

- (void)enqueue:(id)object;
- (id)dequeue;
- (BOOL)isFull;
- (NSUInteger)count;

@end
