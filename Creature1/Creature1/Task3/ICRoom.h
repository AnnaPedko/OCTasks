//
//  ICRoom.h
//  Creature1
//
//  Created by Anna P. on 15.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICFinancialFlow.h"

@interface ICRoom : NSObject
@property (nonatomic, readonly) NSArray     *staff;
@property (nonatomic, assign)   NSUInteger  capacity;
@property (nonatomic, assign)   NSUInteger currentCapacity;

- (void)addWorker:(id<ICFinancialFlow>)worker;
- (void)removeWorker:(id<ICFinancialFlow>)worker;
- (void)addStaff:(NSArray *)staff;
- (id<ICFinancialFlow>)findWorkerByClass:(Class)class;

@end
