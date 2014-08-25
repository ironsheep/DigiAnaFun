//
//  TADViewController.h
//  TESTanadig
//
//  Created by Stephen M Moraco on 12/21/13.
//  Copyright (c) 2013 Iron Sheep Productions, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TADAnalogClock;
@class TADDigit_AnalogClocksController;

@interface TADViewController : UIViewController {

}

@property (strong, nonatomic) IBOutlet TADDigit_AnalogClocksController *vwHourTens;
@property (strong, nonatomic) IBOutlet TADDigit_AnalogClocksController *vwHourOnes;
@property (strong, nonatomic) IBOutlet TADDigit_AnalogClocksController *vwMinuteTens;
@property (strong, nonatomic) IBOutlet TADDigit_AnalogClocksController *vwMinuteOnes;

@property (weak, nonatomic) IBOutlet UISwitch *swManualControl;

@property (weak, nonatomic) IBOutlet UIStepper *nudHourTens;
@property (weak, nonatomic) IBOutlet UIStepper *nudHourOnes;
@property (weak, nonatomic) IBOutlet UIStepper *nudMinuteTens;
@property (weak, nonatomic) IBOutlet UIStepper *nudMinuteOnes;
@property (weak, nonatomic) IBOutlet UIView *vwControlPanel;

@property (weak, nonatomic) IBOutlet TADAnalogClock *vwSampleAnaClk;

- (IBAction)onBtnGoPress:(id)sender;
- (IBAction)onSwManualControlToggled:(UISwitch *)sender;

- (IBAction)onNudHourTensValueChanged:(UIStepper *)sender;
- (IBAction)onNudHourOnesValueChanged:(UIStepper *)sender;
- (IBAction)onNudMinuteTensValueChanged:(UIStepper *)sender;
- (IBAction)onNudMinuteOnesValueChanged:(UIStepper *)sender;

@end
