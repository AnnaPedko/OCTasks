//
//  ICFinancialFlow.h
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ICObjectState) {
    ICObjectBusy,
    ICObjectFree,
};

@protocol ICFinancialFlow <NSObject>
@property (nonatomic, assign)   NSUInteger  money;
@property (nonatomic, assign)   NSUInteger salary;
@property (nonatomic, assign)   ICObjectState   state;

- (void)takeMoney:(NSUInteger)money;
- (NSUInteger)giveMoney;

@optional
- (void)takeMoneyFromObject:(id <ICFinancialFlow>) object;


@end
;
