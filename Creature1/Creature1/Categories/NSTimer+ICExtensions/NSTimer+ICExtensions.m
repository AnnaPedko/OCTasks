//
//  NSTimer+ICExtensions.m
//  Creature1
//
//  Created by Anna P. on 30.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "NSTimer+ICExtensions.h"

#import "ICTimerWeakReference.h"

@implementation NSTimer (ICExtensions)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                     weakTarget:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)yesOrNo {
    id proxyTarget = [[[ICTimerWeakReference alloc] initWithTarget:aTarget selector:aSelector] autorelease];

    return  [NSTimer scheduledTimerWithTimeInterval:ti
                                             target:proxyTarget
                                           selector:@selector(timerDidFire:)
                                           userInfo:userInfo
                                            repeats:yesOrNo];
}

@end
