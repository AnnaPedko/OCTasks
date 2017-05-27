//
//  ICRoom.m
//  Creature1
//
//  Created by Anna P. on 15.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICRoom.h"

#import "NSObject+ICExtensions.h"
#import "NSArray+ICExtensions.h"

#import "ICFinancialFlow.h"

#import "ICEmployee.h"

@interface ICRoom ()
@property (nonatomic, retain) NSMutableArray *mutableObjects;

@end

const static NSUInteger defaultCapacity = 2;

@implementation ICRoom
@dynamic objects;

-(void)dealloc {
    self.mutableObjects = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.capacity = defaultCapacity;
        self.mutableObjects = [NSMutableArray object];
    }
    
    return self;
}

- (void)addObject:(id<ICFinancialFlow>)object {
    if(object) {
        if (self.length < self.capacity) {
            [self.mutableObjects addObject:object];
            self.length++;
        }
    }
}

- (void)removeObject:(id<ICFinancialFlow>)object {
    [self.mutableObjects removeObject:object];
    self.length--;
}

- (void)addObjects:(NSArray *)objects {
    if ((self.length + [objects count]) < self.capacity) {
        self.length += [objects count];
        [self.mutableObjects addObjectsFromArray:objects];
    }
}

- (void)removeObjects:(NSArray *)objects {
    [self.mutableObjects removeObjectsInArray:objects];
    self.length -= [objects count];
}

- (NSArray *)objects {
    return [[self.mutableObjects copy] autorelease];
}

- (ICEmployee *)freeWorkerWithClass:(Class)cls {
    NSArray * classStaff = [self.objects objectsWithClass:cls];
    for (ICEmployee *worker in classStaff) {
        if (worker.state == ICObjectFree) {
            return worker;
        }
    }
    
    return nil;
}

@end
