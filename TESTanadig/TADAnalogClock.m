//
//  TADAnalogClock.m
//  TESTanadig
//
//  Created by Stephen M Moraco on 12/21/13.
//  Copyright (c) 2013 Iron Sheep Productions, LLC. All rights reserved.
//

#import "TADAnalogClock.h"


#pragma mark CLASS TADAnalogClock PRIVATE Interface

@interface TADAnalogClock () {

}

#pragma mark --> PRIVATE Properties
@property (strong, nonatomic) UIImageView *ivHourHand;
@property (strong, nonatomic) UIImageView *ivMinuteHand;
@property (strong, nonatomic) UIImageView *ivSecondHand;

@property (strong, nonatomic) UIImageView *ivClockFace;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSDate *currentTime;
@property (assign, nonatomic, readonly) NSInteger currMinutes;
@property (assign, nonatomic, readonly) NSInteger currHours;
@property (assign, nonatomic, readonly) NSInteger currSeconds;
@property (assign, nonatomic, readonly) NSInteger targetMinutes;
@property (assign, nonatomic, readonly) NSInteger targetHours;
@property (assign, nonatomic, readonly) NSInteger targetSeconds;

@property (assign, nonatomic) CGFloat targetHandsAlpha;
@property (assign, nonatomic) CGFloat targetSecondHandAlpha;

//#pragma mark --> PRIVATE (Utility) Methods


@end


#pragma mark - CLASS TADAnalogClock Implemention

@implementation TADAnalogClock {

}

//#pragma mark --> PUBLIC Property Synthesis Overrides

#pragma mark --> PRIVATE Property Synthesis Overrides

- (NSDateFormatter *)dateFormatter
{
    if(_dateFormatter == nil)
    {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"HH:mm:ss"]; // 24 hour clock
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
    NSRange rngMinutes = NSMakeRange(3, 2);
    NSInteger nMinutes = [[strTime substringWithRange:rngMinutes] integerValue];
    return nMinutes;
}

- (NSInteger)currSeconds
{
    NSString *strTime = [self.dateFormatter stringFromDate:self.currentTime];
    NSRange rngSeconds = NSMakeRange(6, 2);
    NSInteger nSeconds = [[strTime substringWithRange:rngSeconds] integerValue];
    return nSeconds;
}

- (NSInteger)targetHours
{
    NSString *strTime = [self.dateFormatter stringFromDate:self.targetTime];
    NSInteger nHours = [[strTime substringToIndex:2] integerValue];
    return nHours;
}

- (NSInteger)targetMinutes
{
    NSString *strTime = [self.dateFormatter stringFromDate:self.targetTime];
    NSRange rngMinutes = NSMakeRange(3, 2);
    NSInteger nMinutes = [[strTime substringWithRange:rngMinutes] integerValue];
    return nMinutes;
}

- (NSInteger)targetSeconds
{
    NSString *strTime = [self.dateFormatter stringFromDate:self.targetTime];
    NSRange rngSeconds = NSMakeRange(6, 2);
    NSInteger nSeconds = [[strTime substringWithRange:rngSeconds] integerValue];
    return nSeconds;
}

//#pragma mark --> CLASS (Static) Methods

//#pragma mark --> PUBLIC Property Overrides

#pragma mark --> PUBLIC Instance Methods

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        DLog(@"");
        //self.backgroundColor = [UIColor redColor];
        CGRect rctHandFrame = CGRectMake(0, 0, 66, 66);

        UIImageView *imgClockFace = [[UIImageView alloc] initWithFrame:rctHandFrame];
        imgClockFace.image = UIImageFromBundlePngImageNamed(@"clkFace002");
        [self addSubview:imgClockFace];

        self.ivHourHand = [[UIImageView alloc] initWithFrame:rctHandFrame];
        //_ivHourHand.backgroundColor = [UIColor greenColor];
        _ivHourHand.image = UIImageFromBundlePngImageNamed(@"sqHourHand"); // at 6PM
        [self addSubview:_ivHourHand];

        self.ivMinuteHand = [[UIImageView alloc] initWithFrame:rctHandFrame];
        _ivMinuteHand.image = UIImageFromBundlePngImageNamed(@"sqMinuteHand");  // at 15 After
        [self addSubview:_ivMinuteHand];

        self.ivSecondHand = [[UIImageView alloc] initWithFrame:rctHandFrame];
        _ivSecondHand.image = UIImageFromBundlePngImageNamed(@"sqSecondHand");  // at 15 After
        [self addSubview:_ivSecondHand];

        // adjust starting time to reflect initial position of our hands...
        NSDate *dtStartingTime = [NSDate date];
        NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit |NSSecondCalendarUnit;
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone = [NSTimeZone localTimeZone];
        NSDateComponents *comps = [calendar components:unitFlags fromDate:dtStartingTime];
        comps.hour = 18;
        comps.minute = 15;
        comps.second = 15;
        self.currentTime = [calendar dateFromComponents:comps];
        DLog(@"- clock sitting at: %@", self.currentTime);
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        DLog(@"");
        self.backgroundColor = [UIColor redColor];

        CGRect rctHandFrame = CGRectMake(0, 0, 66, 66);

        UIImageView *imgClockFace = [[UIImageView alloc] initWithFrame:rctHandFrame];
        imgClockFace.image = UIImageFromBundlePngImageNamed(@"clkFace001");
        [self addSubview:imgClockFace];

        self.ivHourHand = [[UIImageView alloc] initWithFrame:rctHandFrame];
        //_ivHourHand.backgroundColor = [UIColor greenColor];
        _ivHourHand.image = UIImageFromBundlePngImageNamed(@"sqHourHand"); // at 6PM
        [self addSubview:_ivHourHand];

        self.ivMinuteHand = [[UIImageView alloc] initWithFrame:rctHandFrame];
        _ivMinuteHand.image = UIImageFromBundlePngImageNamed(@"sqMinuteHand");  // at 15 After
        [self addSubview:_ivMinuteHand];

        self.ivSecondHand = [[UIImageView alloc] initWithFrame:rctHandFrame];
        _ivSecondHand.image = UIImageFromBundlePngImageNamed(@"sqSecondHand");  // at 15 After
        [self addSubview:_ivSecondHand];

        // adjust starting time to reflect initial position of our hands...
        NSDate *dtStartingTime = [NSDate date];
        NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit |NSSecondCalendarUnit;
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone = [NSTimeZone localTimeZone];
        NSDateComponents *comps = [calendar components:unitFlags fromDate:dtStartingTime];
        comps.hour = 18;
        comps.minute = 15;
        comps.second = 15;
        self.currentTime = [calendar dateFromComponents:comps];
        DLog(@"- clock sitting at: %@", self.currentTime);
    }
    return self;
}

#define degreesToRadians(deg) (deg / 180.0 * M_PI)


- (void)animateToTargetTime
{
    DLog(@"- clock sitting at: %@ but heading to: %@", [self.dateFormatter stringFromDate:self.currentTime], [self.dateFormatter stringFromDate:self.targetTime]);
    CGFloat duration           = 1.f;
    UIViewAnimationOptions curve = UIViewAnimationOptionCurveLinear;

    self.targetHandsAlpha = 1.0;
    self.targetSecondHandAlpha = 1.0;
    if((self.targetHours == 7 || self.targetHours == 19) && (self.targetMinutes == 35))
    {
        // simultaneously fade out these hands!
        self.targetHandsAlpha = 0.0;
    }
    if(self.targetSeconds == 37)
    {
        self.targetSecondHandAlpha = 0.0;
    }

    void (^updateHands)(void) = ^ {
        [self updateHoursHand];
        [self updateMinutesHand];
        [self updateSecondsHand];
    };

    [UIView animateWithDuration:duration
                          delay:0.f
                        options:curve
                     animations:updateHands
                     completion:nil];
}

//#pragma mark --> Interface-builder Action Methods

//#pragma mark --> PRIVATE Property Overrides

#pragma mark --> PRIVATE (Utility) Methods

- (void)updateHoursHand
{
    int degreesPerHour   = 30;
    float degreesPerMinute = 0.5;

    int hours = self.targetHours - self.currHours;
    int minutes = self.targetMinutes - self.currMinutes;

    int hoursFor12HourClock = hours % 12;

    float rotationForHoursComponent  = hoursFor12HourClock * degreesPerHour;
    float rotationForMinuteComponent = degreesPerMinute * minutes;
    if(self.minutesDontAffectHourHand)
    {
        rotationForMinuteComponent = 0; // special for our digits controller!
    }

    float totalRotation = rotationForHoursComponent + rotationForMinuteComponent;

    double hourAngle = degreesToRadians(totalRotation);

    self.ivHourHand.transform = CGAffineTransformRotate(CGAffineTransformIdentity, hourAngle);
    self.ivHourHand.alpha = self.targetHandsAlpha;
}

- (void)updateMinutesHand
{
    int degreesPerMinute = 6;

    int minutes = self.targetMinutes - self.currMinutes;
    double minutesAngle = degreesToRadians(minutes * degreesPerMinute);

    self.ivMinuteHand.transform = CGAffineTransformRotate(CGAffineTransformIdentity, minutesAngle);
    self.ivMinuteHand.alpha = self.targetHandsAlpha;
}

- (void)updateSecondsHand
{
    int degreesPerSecond = 6;

    int seconds = self.targetSeconds - self.currSeconds;
    double secondsAngle = degreesToRadians(seconds * degreesPerSecond);

    self.ivSecondHand.transform = CGAffineTransformRotate(CGAffineTransformIdentity, secondsAngle);
    self.ivSecondHand.alpha = self.targetSecondHandAlpha;
}



@end
