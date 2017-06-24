//
//  ICDispatch.h
//  Creature1
//
//  Created by Anna P. on 17.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICFinancialFlow.h"
#import "ICQueue.h"
#import "ICEmployee.h"

@interface ICDispatch : NSObject <ICEmployeeObserver>

- (void)performProcessingWithObject:(id<ICFinancialFlow>)object;

- (void)addWorker:(id)worker;
- (void)addWorkers:(NSArray *)workers;
- (void)removeWorker:(id)worker;

@end
