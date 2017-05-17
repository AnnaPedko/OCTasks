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


@interface ICCarWash()


@end

@implementation ICCarWash
@synthesize state;
@synthesize salary;

- (void) dealloc {
    
    [super dealloc];
}

- (instancetype) init {
    self = [super init];
    if (self) {
        self.money = 400;
        self.price = 200;
    }
    
    return self;
    
}

- (ICBuilding *)createBuildingWithRooms:(NSUInteger)rooms staff:(NSArray *)staff {
    ICBuilding *build = [[[ICBuilding alloc] initWithObjects:rooms] autorelease];
    for (ICRoom *room in build.rooms) {
        [room addStaff:staff];
    }
    
    return build;
};

- (void)washCars:(NSArray *)cars {
    ICWasher *washer = [ICWasher object];
    ICAccountant *accountant = [ICAccountant object];
    ICDirector *director = [ICDirector object];
    ICBuilding *build = [self createBuildingWithRooms:1 staff:@[director,accountant]];
    ICBuilding *washBox = [self createBuildingWithRooms:1 staff:@[washer]];
    for (id<ICFinancialFlow> car in cars) {
        ICWasher *freeWasher = [washBox findWorkerByClass:[ICWasher class]];
        [freeWasher processObject:car];
        ICAccountant *freeAccountant = [build findWorkerByClass:[ICAccountant class]];
        [freeAccountant processObject:freeWasher];
        ICDirector *freeDirector = [build findWorkerByClass:[ICDirector class]];
        [freeDirector processObject:freeAccountant];
        NSLog (@"Profit = %lu",freeDirector.money);
    }
    
}




@end
