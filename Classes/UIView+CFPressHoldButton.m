//
//  UIView+CFPressHoldButton.m
//  CFPressHoldButton
//
//  Created by Hiromasa OHNO on 2014/05/29.
//  Copyright (c) 2014年 CFlat. All rights reserved.
//

#import "UIView+CFPressHoldButton.h"
#import <objc/runtime.h>

@implementation UIView (CFPressHoldButton)

@dynamic delegate;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.delegate){
        [self.delegate didStartHolding:self];
    } else {
        [super touchesBegan:touches withEvent:event];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.delegate){
        [self.delegate didFinishHolding:self];
    } else {
        [super touchesEnded:touches withEvent:event];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.delegate){
        [self.delegate didFinishHolding:self];
    } else {
        [super touchesCancelled:touches withEvent:event];
    }
}

- (void)setDelegate:(id<CFPressHoldButtonDelegate>)delegate
{
    objc_setAssociatedObject(self, _cmd, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<CFPressHoldButtonDelegate>)delegate
{
    return objc_getAssociatedObject(self, @selector(setDelegate:));
}

@end

