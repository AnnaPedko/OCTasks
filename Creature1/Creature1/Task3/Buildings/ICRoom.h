//
//  ICRoom.h
//  Creature1
//
//  Created by Anna P. on 15.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICFinancialFlow.h"

#import "ICEmployee.h"

@interface ICRoom : NSObject
@property (nonatomic, readonly) NSArray     *objects;
@property (nonatomic, assign)   NSUInteger  capacity;
@property (nonatomic, assign)   NSUInteger  length;

- (void)addObject:(id<ICFinancialFlow>)object;
- (void)removeObject:(id<ICFinancialFlow>)object;
- (void)addObjects:(NSArray *)objects;
- (void)removeObjects:(NSArray *)objects;
- (NSArray *)employeesWithClass:(Class)cls;

@end
