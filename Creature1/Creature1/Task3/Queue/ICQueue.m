//
//  ICQueue.m
//  Creature1
//
//  Created by Anna P. on 14.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICQueue.h"

@interface ICQueue ()
@property (nonatomic, retain)   NSMutableArray  *mutableQqueue;

- (void)removeObject:(id)object;

@end

@implementation ICQueue

@dynamic queue;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableQqueue = [NSMutableArray object];
    }
    
    return self;
}

#pragma mark -
#pragma Public Methods

- (void)enqueue:(id)object {
    @synchronized (self) {
        if (object) {
            [self.mutableQqueue addObject:object];
        }
    }
}

- (id)dequeue {
    @synchronized (self) {
        id object = [[self.queue.firstObject retain] autorelease];
        [self.mutableQqueue removeObject:object];
        
        return object;
    }
}

- (BOOL)isEmpty {
    return ![self count];
}

- (NSUInteger)count {
    @synchronized (self) {
        return [self.queue count];
    }
}

- (NSArray *)queue {
    @synchronized (self) {
        return [[self.mutableQqueue copy] autorelease];
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
        [self.mutableQqueue removeObject:object];
    }
}


@end
