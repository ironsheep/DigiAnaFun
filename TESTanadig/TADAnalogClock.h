//
//  TADAnalogClock.h
//  TESTanadig
//
//  Created by Stephen M Moraco on 12/21/13.
//  Copyright (c) 2013 Iron Sheep Productions, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


//#pragma mark PROTOCOL Forward Declarations


#pragma mark CLASS TADAnalogClock PUBLIC Interface

@interface TADAnalogClock : UIView {

}

#pragma mark --> PUBLIC Properties

@property (strong, nonatomic) NSDate *targetTime;
@property (assign, nonatomic) BOOL minutesDontAffectHourHand;

//#pragma mark --> Interface-builder Outlet Properties

//#pragma mark --> CLASS (Static) Methods

#pragma mark --> PUBLIC Instance Methods

- (void)animateToTargetTime;

//#pragma mark --> Interface-builder Action Methods

@end
