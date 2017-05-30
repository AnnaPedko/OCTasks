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

#import "NSArray+ICExtensions.h"
#import "NSObject+ICExtensions.h"

const static NSUInteger ICDefaultMoney = 400;
const static NSUInteger ICDefaultCountOfRooms = 3;

@implementation ICCarWash

- (void)dealloc {
    self.adminBuilding = nil;
    self.washBox = nil;
    
    [super dealloc];
}

- (id<ICFinancialFlow>)freeEmployeeWithClass:(Class)cls {
    NSArray *employeesWithClass = [self employeesWithClass:cls];
    return [[employeesWithClass filteredArrayWithBlock:^BOOL(ICEmployee *employee){
        return employee.state == ICObjectFree;
    }]firstObject];
}

- (NSArray *)employeesWithClass:(Class)cls {
    NSMutableArray *employees = [NSMutableArray object];
    NSArray *enterprise = @[self.adminBuilding, self.washBox];
    for (ICBuilding * building in enterprise) {
        NSArray* specificEmmployees = [building employeesWithClass:cls];
        if (specificEmmployees.count > 0) {
            [employees addObjectsFromArray:specificEmmployees];
        }
    }
    
    return [[employees copy]autorelease];
}

- (instancetype)init {
    
        self.money = ICDefaultMoney;
        self.adminBuilding = [ICBuilding object];
        self.washBox = [ICBuilding object];
        [self prepareEnterprise:self.adminBuilding
                      withRooms:ICDefaultCountOfRooms
                       andStaff:@[[ICAccountant class], [ICDirector class], [ICWasher class]]];
        [self prepareEnterprise:self.washBox
                      withRooms:ICDefaultCountOfRooms
                       andStaff:@[[ICWasher class]]];
    
    return self;
}

- (void)prepareEnterprise:(ICBuilding *)building withRooms:(NSUInteger)countOfRooms andStaff:(NSArray *)staff {
    NSArray * rooms = [ICRoom objectsWithCount:countOfRooms];
    [building addRooms:rooms];
    for (ICRoom *room in building.rooms) {
        for (id employee in staff) {
            [room addObject:[employee object]];
            NSLog(@"Room description = %@",[room description]);
        }
    }
}

- (void)washCars:(NSArray *)cars {
    for (ICCar* car in cars) {
        ICWasher *washer = [self freeEmployeeWithClass:[ICWasher class]];
        [washer processObject:car];
        ICAccountant *accountant = [self freeEmployeeWithClass:[ICAccountant class]];
        [accountant processObject:washer];
        ICDirector *director = [self freeEmployeeWithClass:[ICDirector class]];
        [director processObject:accountant];
        NSLog (@"Profit = %lu",director.money);
    }
}

@end
