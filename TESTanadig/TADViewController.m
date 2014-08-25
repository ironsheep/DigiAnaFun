//
//  TADViewController.m
//  TESTanadig
//
//  Created by Stephen M Moraco on 12/21/13.
//  Copyright (c) 2013 Iron Sheep Productions, LLC. All rights reserved.
//

#import "TADViewController.h"
#import "TADAnalogClock.h"
#import "TADDigit-AnalogClocksController.h"

#import "UIView+Animate.h"

@interface TADViewController () {
    BOOL m_bIsTimerRunning;
}

@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (assign, nonatomic, readonly) NSInteger currMinutes;
@property (assign, nonatomic, readonly) NSInteger currHours;
@property (strong, nonatomic) NSDate *currentTime;
@property (strong, nonatomic) NSTimer *tmrClockUpdate;


- (void)updateDigitsWithCurrentTime;
- (void)handleTimeToUpdate:(NSTimer *)timer;

@end

@implementation TADViewController

- (void)viewDidLoad
{
    DLog(@"");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    DLog(@"");
    [super viewWillAppear:animated];

    // force initial state of display
    //[self onNudHourOnesValueChanged:self.nudHourOnes];

    self.swManualControl.on = YES;
    self.vwControlPanel.alpha = 0.0; // switch press treats this!

    m_bIsTimerRunning = YES;
    [self updateDigitsWithCurrentTime];

    self.tmrClockUpdate = [NSTimer scheduledTimerWithTimeInterval:15 target:self selector:@selector(handleTimeToUpdate:) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    DLog(@"");
    [super viewWillDisappear:animated];

    [self.tmrClockUpdate invalidate];
    self.tmrClockUpdate = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBtnGoPress:(id)sender {
    DLog(@"");
    self.vwSampleAnaClk.targetTime = [NSDate date];
    [self.vwSampleAnaClk animateToTargetTime];
}

- (IBAction)onSwManualControlToggled:(UISwitch *)sender {
    DLog(@"");
    if(sender.on == NO)
    {
        m_bIsTimerRunning = NO;
        [self.vwControlPanel animateShow:YES];
    }
    else
    {
        m_bIsTimerRunning = YES;
        [self.vwControlPanel animateShow:NO];
        [self updateDigitsWithCurrentTime];
    }
}

- (IBAction)onNudHourTensValueChanged:(UIStepper *)sender {
    DLog(@"- HourTens heading to %.0f", sender.value);
    self.vwHourTens.targetDigit0_9 = sender.value;
    [self.vwHourTens animateToTargetDigit];
}

- (IBAction)onNudHourOnesValueChanged:(UIStepper *)sender {
    DLog(@"- HourOnes heading to %.0f", sender.value);
    self.vwHourOnes.targetDigit0_9 = sender.value;
    [self.vwHourOnes animateToTargetDigit];
}

- (IBAction)onNudMinuteTensValueChanged:(UIStepper *)sender {
    DLog(@"- MinuteTens heading to %.0f", sender.value);
    self.vwMinuteTens.targetDigit0_9 = sender.value;
    [self.vwMinuteTens animateToTargetDigit];
}

- (IBAction)onNudMinuteOnesValueChanged:(UIStepper *)sender {
    DLog(@"- MinuteOnes heading to %.0f", sender.value);
    self.vwMinuteOnes.targetDigit0_9 = sender.value;
    [self.vwMinuteOnes animateToTargetDigit];
}

- (void)handleTimeToUpdate:(NSTimer *)timer
{
    DLog();
    if(m_bIsTimerRunning)
    {
        [self updateDigitsWithCurrentTime];
    }
}

- (void)updateDigitsWithCurrentTime
{
    self.currentTime = [NSDate date];
    NSInteger nHours = self.currHours;
    NSInteger nMinutes = self.currMinutes;

    self.vwHourTens.targetDigit0_9 = nHours / 10;
    [self.vwHourTens animateToTargetDigit];
    self.vwHourOnes.targetDigit0_9 = nHours % 10;
    [self.vwHourOnes animateToTargetDigit];
    self.vwMinuteTens.targetDigit0_9 = nMinutes / 10;
    [self.vwMinuteTens animateToTargetDigit];
    self.vwMinuteOnes.targetDigit0_9 = nMinutes % 10;
    [self.vwMinuteOnes animateToTargetDigit];

}

- (NSDateFormatter *)dateFormatter
{
    if(_dateFormatter == nil)
    {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"HH:mm"]; // 24 hour clock
    }
    return _dateFormatter;
}

- (NSInteger)currHours
{
    NSString *strTime = [self.dateFormatter stringFromDate:self.currentTime];
    NSInteger nHours = [[strTime substringToIndex:2] integerValue];
    return nHours;
}

- (NSInteger)currMinutes
{
    NSString *strTime = [self.dateFormatter stringFromDate:self.currentTime];
    NSInteger nMinutes = [[strTime substringFromIndex:3] integerValue];
    return nMinutes;
}



@end
