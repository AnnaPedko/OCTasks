//
//  ICQueue.m
//  Creature1
//
//  Created by Anna P. on 14.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICQueue.h"

@implementation ICQueue

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.queue = [NSMutableArray object];
    }
    
    return self;
}

#pragma mark -
#pragma Public Methods

- (void)enqueue:(id)object {
    if (object) {
        [self.queue addObject:object];
     }
}

- (id)dequeue {
    id object = [self.queue objectAtIndex:0];
    if (object) {
        [[object retain] autorelease];
        [self.queue removeObjectAtIndex:0];
    }
    
    return object;
}

- (BOOL)isFull {
    if ([self count]) {
        return YES;
    } else {
        return NO;
    }
}

- (NSUInteger)count {
    return self.queue.count;
}

@end
