//
//  ICObservableObject.h
//  Creature1
//
//  Created by Anna P. on 02.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICObservableObject : NSObject
@property (nonatomic, assign) NSUInteger  state;
@property (nonatomic, readonly) NSSet   *observers;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObservedByObjects:(id)observer;

//This method is intended for subclassing. Never call it directly
- (SEL)selectorForState:(NSUInteger)state;
- (void)notifyOfChangeState:(NSUInteger)state;

@end
