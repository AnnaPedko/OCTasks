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
- (void)addObservers:(id)observers;
- (void)removeObserver:(id)observer;
- (BOOL)isObservedByObjects:(id)observer;
- (void)removeObservers;

//This method is intended for subclassing. Never call it directly
- (SEL)selectorForState:(NSUInteger)state;
- (void)notifyOfState:(NSUInteger)state;

@end
