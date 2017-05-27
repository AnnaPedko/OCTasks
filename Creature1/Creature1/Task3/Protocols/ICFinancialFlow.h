//
//  ICFinancialFlow.h
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICFinancialFlow <NSObject>
@property (nonatomic, assign)   NSUInteger  money;

- (NSUInteger)giveMoney;

@optional
- (void)takeMoneyFromObject:(id <ICFinancialFlow>) object;
- (void)takeMoney:(NSUInteger)money;

@end;
