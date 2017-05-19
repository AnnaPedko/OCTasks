//
//  ICRoom.m
//  Creature1
//
//  Created by Anna P. on 15.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICRoom.h"

#import "NSObject+ICExtensions.h"
#import "NSObject+ICInitObject.h"

#import "ICFinancialFlow.h"


@interface ICRoom ()
@property (nonatomic,retain) NSMutableArray *mutableStaff;

@end

const static NSUInteger defaultCapacity = 2;
const static NSUInteger defaultCurrentCapacity = 0;

@implementation ICRoom
@dynamic staff;

-(void)dealloc {
    self.mutableStaff = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.capacity = defaultCapacity;
        self.currentCapacity = defaultCurrentCapacity;
        self.mutableStaff = [NSMutableArray object];
    }
    
    return self;
}

- (void)addWorker:(id<ICFinancialFlow>)worker {
    if(worker) {
        [self.mutableStaff addObject:worker];
    }
}

- (void)removeWorker:(id<ICFinancialFlow>)worker {
    [self.mutableStaff removeObject:worker];
}

- (void) addStaff:(NSArray *)staff {
    return [self.mutableStaff addObjectsFromArray:staff];
}
     
- (NSArray *)staff {
    return [[self.mutableStaff copy] autorelease];
}

- (id<ICFinancialFlow>)findWorkerByClass:(Class)class {
    id <ICFinancialFlow> freeWorker = nil;
    for (id <ICFinancialFlow> worker in self.staff) {
        if ([worker isMemberOfClass:class]) {
            if (worker.state == ICObjectFree) {
                freeWorker = worker;
                break;
            }
        }
    }
    
    return freeWorker;
}


@end
