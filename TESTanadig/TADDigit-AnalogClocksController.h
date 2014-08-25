//
//  TADDigit-AnalogClocksController.h
//  TESTanadig
//
//  Created by Stephen M Moraco on 12/21/13.
//  Copyright (c) 2013 Iron Sheep Productions, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


//#pragma mark PROTOCOL Forward Declarations


#pragma mark CLASS TADDigit_AnalogClocksController PUBLIC Interface

@interface TADDigit_AnalogClocksController : UIView {

}

#pragma mark --> PUBLIC Properties

@property (assign, nonatomic) NSInteger targetDigit0_9;

//#pragma mark --> Interface-builder Outlet Properties

//#pragma mark --> CLASS (Static) Methods

#pragma mark --> PUBLIC Instance Methods

- (void)animateToTargetDigit;

//#pragma mark --> Interface-builder Action Methods

@end
