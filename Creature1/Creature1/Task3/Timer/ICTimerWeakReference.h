//
//  ICTimerWeakReference.h
//  Creature1
//
//  Created by Anna P. on 30.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICTimerWeakReference : NSObject
- (instancetype)initWithTarget:(id)aTarget selector:(SEL)aSelector;
- (void)timerDidFire:(NSTimer *)timer;

@end
