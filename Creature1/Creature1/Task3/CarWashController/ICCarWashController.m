//
//  ICCarWashController.m
//  Creature1
//
//  Created by Anna P. on 15.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCarWashController.h"

#import "ICDispatch.h"

#import "ICEmployee.h"
#import "ICCar.h"
#import "ICWasher.h"
#import "ICAccountant.h"
#import "ICDirector.h"

typedef NSArray *(^ICEmployeeGenerator)(NSUInteger count, Class class, id observer);

static NSUInteger ICNumberOfAccountants = 3;
static NSUInteger ICNumberOfWashers = 2;
static NSUInteger ICNumberOfDirectors = 1;

@interface ICCarWashController () <ICEmployeeObserver>
@property (nonatomic, retain)   ICDispatch  *washerDispatch;
@property (nonatomic, retain)   ICDispatch  *accountantDispatch;
@property (nonatomic, retain)   ICDispatch  *directorDispatch;

@end

@implementation ICCarWashController

- (void)dealloc {
    self.washerDispatch = nil;
    self.accountantDispatch = nil;
    self.directorDispatch = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.washerDispatch = [ICDispatch object];
        self.accountantDispatch = [ICDispatch object];
        self.directorDispatch = [ICDispatch object];
        
        [self prepareEnterprise];
    }
    
    return self;
}

- (void)prepareEnterprise {
    ICDispatch *directorDispath = self.directorDispatch;
    ICDispatch *accountantDispatch = self.accountantDispatch;
    ICDispatch *washerDispath = self.washerDispatch;
    
     ICEmployeeGenerator generator = ^NSArray *(NSUInteger count, Class cls, id observer){
        return [NSArray objectsWithCount:count factory:^id{
            id employee = [cls object];
            [employee addObserver:observer];
            
            return employee;
        }];
    };
    
    NSArray *washers = generator(ICNumberOfWashers, [ICWasher class], accountantDispatch);
    NSArray *accountants = generator(ICNumberOfAccountants, [ICAccountant class], directorDispath);
    NSArray *director = generator(ICNumberOfDirectors, [ICDirector class], nil);
    
    [washerDispath addWorkers:washers];
    [accountantDispatch addWorkers:accountants];
    [directorDispath addWorkers:director];
}

- (void)washCars:(id)cars {
    @synchronized (self) {
        for (ICCar *car in cars) {
            [self.washerDispatch performProcessingWithObject:car];
        }
    }
}

@end
