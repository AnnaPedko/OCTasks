//
//  ICBuilding.m
//  Creature1
//
//  Created by Anna P. on 27.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICBuilding.h"

#import "NSObject+ICExtensions.h"

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
    self.mutableRooms = [NSMutableArray object];
    
    return self;
}

- (NSArray *)employeesWithClass:(Class)cls {
    NSMutableArray *employees = [[[NSMutableArray alloc]init]autorelease];
    for (ICRoom *room in self.rooms) {
        NSArray* specificEmmployees = [room employeesWithClass:cls];
        if (specificEmmployees.count > 0) {
            [employees addObjectsFromArray:specificEmmployees];
        }
    }
    return [[employees copy]autorelease];
}

- (void)addRoom:(ICRoom *)room {
    if (room) {
        [self.mutableRooms addObject:room];
    }
}

- (void)addRooms:(NSArray *)objects {
    return [self.mutableRooms addObjectsFromArray:objects];
}

- (void)removeRoom:(ICRoom *)room {
    [self.mutableRooms removeObject:room];
}

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

@end
