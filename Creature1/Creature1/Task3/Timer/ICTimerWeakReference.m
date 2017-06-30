//
//  ICTimerWeakReference.m
//  Creature1
//
//  Created by Anna P. on 30.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICTimerWeakReference.h"
@interface ICTimerWeakReference ()

@property (nonatomic, assign)   id    target;
@property (nonatomic, assign)   SEL   selector;

- (void)timerDidFire:(NSTimer *)timer;
@end

@implementation ICTimerWeakReference

- (instancetype)initWithTarget:(id)aTarget selector:(SEL)aSelector {
    self = [super init];
    if (self) {
        self.target = aTarget;
        self.selector = aSelector;
    }
    
    return self;
}

- (void)timerDidFire:(NSTimer *)timer {
    id target = self.target;
    if (target) {
        [target performSelector:self.selector withObject:timer];
    } else {
        [timer invalidate];
    }
}

@end
