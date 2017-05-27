//
//  ICBuilding.m
//  Creature1
//
//  Created by Anna P. on 27.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICBuilding.h"

#import "NSObject+ICExtensions.h"

const static NSUInteger defaultCountOfRooms = 1;

@implementation ICBuilding

- (void)dealloc {
    self.rooms = nil;
    
    [super dealloc];
}

- (instancetype)initWithObjects:(NSUInteger)count {
    self = [super init];
    if (self) {
        self.rooms = [ICRoom objectsWithCount:count];
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    
    return [self initWithObjects:defaultCountOfRooms];
}

- (id<ICFinancialFlow>)freeWorkerWithClass:(Class)cls {
    for (ICRoom *room in self.rooms) {
        return [room freeWorkerWithClass:cls];
    }
    
    return nil;
}

@end
