//
//  ICFinancialFlow.h
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICFinancialFlow <NSObject>

@property (nonatomic, assign, getter = isReady) BOOL condition;

- (void) takeMoney:(NSObject *) object;
@end
