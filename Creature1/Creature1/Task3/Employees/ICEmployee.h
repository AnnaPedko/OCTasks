//
//  ICEmployee.h
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICObservableObject.h"
#import "ICQueue.h"

#import "ICFinancialFlow.h"

@class ICEmployee;

typedef NS_ENUM(NSUInteger, ICObjectState) {
    ICObjectFree,
    ICObjectBusy,
    ICObjectReadyForProcessing
};

@protocol ICEmployeeObserver <NSObject>

@optional
- (void)employeeDidFinishWork:(id<ICFinancialFlow>)employee;
- (void)employeeDidBecomeBusy:(id<ICFinancialFlow>)employee;
- (void)employeeReadyForProcessing:(id<ICFinancialFlow>)employee;

@end

@interface ICEmployee : ICObservableObject <ICFinancialFlow>
@property (nonatomic, assign)   NSUInteger    money;
@property (nonatomic, assign)   NSUInteger    salary;
@property (nonatomic, assign)   NSUInteger    experience;
@property (nonatomic, retain)   ICQueue     *queue;

- (void)performObjectSpecificOperation:(id)object;
- (void)processObject:(id<ICFinancialFlow>)object;
- (void)finishWork;
- (void)finishProcessObject:(id)object;
- (void)workWithObject:(id)object;

@end
