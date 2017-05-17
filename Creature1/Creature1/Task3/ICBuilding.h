//
//  ICBuilding.h
//  Creature1
//
//  Created by Anna P. on 27.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICRoom.h"

@interface ICBuilding : NSObject
@property (nonatomic,copy)  NSArray  *rooms;

- (id<ICFinancialFlow>)findWorkerByClass:(Class)worker;
- (instancetype)initWithObjects:(NSUInteger)count;


@end
