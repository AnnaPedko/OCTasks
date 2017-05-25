//
//  ICCarWash.m
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCarWash.h"
#import "ICCar.h"
#import "ICWasher.h"
#import "ICBuilding.h"
#import "ICAccountant.h"
#import "ICDirector.h"

#import "NSObject+ICInitObject.h"
#import "NSObject+ICExtensions.h"
#import "NSArray+ICExtensions.h"

const static NSUInteger defaultMoney = 400;

@implementation ICCarWash

- (void)dealloc {
    self.adminBuilding = nil;
    self.washBox = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.money = defaultMoney;
        self.washBox = [self buildingWithRooms:1 staff:@[[ICWasher object]]];
        self.adminBuilding = [self buildingWithRooms:1 staff:@[[ICDirector object], [ICAccountant object]]];
    }
    
    return self;
}

- (ICBuilding *)buildingWithRooms:(NSUInteger)rooms staff:(NSArray *)staff {
    ICBuilding *build = [[[ICBuilding alloc] initWithObjects:rooms] autorelease];
    for (ICRoom *room in build.rooms) {
        [room addStaff:staff];
    }
    
    return build;
};

/*- (void)addCar:(ICCar *)car {
    for (ICRoom *room in self.washBox.rooms) {
        if (room.currentCapacity<room.capacity) {
            [room addWorker:car];
            room.currentCapacity += 1;
            car.room = room;
            break;
        }
    }
}*/

/*- (void)removeCar:(ICCar *)car {
    for (ICRoom *room in self.washBox.rooms) {
        if ([room isEqual:car.room]) {
            [room removeWorker:car];
            room.capacity -= 1;
            car.room = nil;
        }
        
        break;
    }
}*/

- (void)washCars:(NSArray *)cars {
    for (ICCar* car in cars) {
        ICWasher *freeWasher = [self.washBox findWorkerByClass:[ICWasher class]];
        //[self addCar:car];
        [freeWasher processObject:car];
        //[self removeCar:car];
        ICAccountant *freeAccountant = [self.adminBuilding findWorkerByClass:[ICAccountant class]];
        [freeAccountant processObject:freeWasher];
        ICDirector *freeDirector = [self.adminBuilding findWorkerByClass:[ICDirector class]];
        [freeDirector processObject:freeAccountant];
        NSLog (@"Profit = %lu",freeDirector.money);
    }
}

@end
