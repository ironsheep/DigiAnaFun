//
//  UIView+Animate.m
//  TESTanadig
//
//  Created by Stephen M Moraco on 12/22/13.
//  Copyright (c) 2013 Iron Sheep Productions, LLC. All rights reserved.
//

#import "UIView+Animate.h"

#pragma mark CATEGORY UIView (Animate) Implementation

@implementation UIView (Animate)

- (void)animateShow:(BOOL)bShow
{
    CGFloat fTargetAlpha = (bShow) ? 1.0 : 0.0;
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.alpha = fTargetAlpha;
    } completion:^(BOOL finished) {
        // stub
    }];
}


@end
