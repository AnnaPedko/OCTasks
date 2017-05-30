//
//  ICEmployee.h
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICFinancialFlow.h"

typedef NS_ENUM(NSUInteger, ICObjectState) {
    ICObjectFree,
    ICObjectBusy,
};

@interface ICEmployee : NSObject <ICFinancialFlow>
@property (nonatomic, assign)   NSUInteger    money;
@property (nonatomic, assign)   NSUInteger    salary;
@property (nonatomic, assign)   NSUInteger    experience;
@property (nonatomic, assign)   ICObjectState   state;

- (void)performObjectSpecificOperation:(id)object;
- (void)processObject:(id<ICFinancialFlow>)object;

@end
