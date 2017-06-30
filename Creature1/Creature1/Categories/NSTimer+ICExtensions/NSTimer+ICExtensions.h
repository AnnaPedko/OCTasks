//
//  NSTimer+ICExtensions.h
//  Creature1
//
//  Created by Anna P. on 30.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (ICExtensions)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                             weakTarget:(id)aTarget
                                           selector:(SEL)aSelector
                                           userInfo:(id)userInfo
                                            repeats:(BOOL)yesOrNo;

@end
