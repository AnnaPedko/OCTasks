//
//  ICBuilding.m
//  Creature1
//
//  Created by Anna P. on 27.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICBuilding.h"

#import "NSObject+ICExtensions.h"

const static NSUInteger ICDefaultCountOfRooms = 1;

@interface ICBuilding ()
@property (nonatomic, retain)   NSMutableArray *mutableRooms;

@end

@implementation ICBuilding

@dynamic rooms;

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    
    self = [super init];
    
    return self;
}

- (NSArray *)employeesWithClass:(Class)cls {
    NSMutableArray *employees = [[[NSMutableArray alloc]init]autorelease];
    for (ICRoom *room in self.rooms) {
        if ([room employeesWithClass:cls]) {
            [employees addObject:[room employeesWithClass:cls]];
        }
    }
    return [NSArray arrayWithArray:employees];
}

- (void)addRoom:(ICRoom *)room {
    if (room) {
        [self.mutableRooms addObject:room];
    }
}

- (void)addRooms:(NSArray *)objects {
    [self.mutableRooms addObjectsFromArray:objects];
}

- (void)removeRoom:(ICRoom *)room {
    [self.mutableRooms removeObject:room];
}

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

@end
