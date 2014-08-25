//
//  TADDigit-AnalogClocksController.m
//  TESTanadig
//
//  Created by Stephen M Moraco on 12/21/13.
//  Copyright (c) 2013 Iron Sheep Productions, LLC. All rights reserved.
//

#import "TADDigit-AnalogClocksController.h"
#import "TADAnalogClock.h"

#pragma mark CLASS TADDigit_AnalogClocksController PRIVATE Interface

@interface TADDigit_AnalogClocksController () {

}

#pragma mark --> PRIVATE Properties

@property (strong, nonatomic) NSArray *analogClocksAr;
@property (strong, nonatomic) NSArray *digits0thru9Ar;


//#pragma mark --> PRIVATE (Utility) Methods


@end


#pragma mark - CLASS TADDigit_AnalogClocksController Implemention

@implementation TADDigit_AnalogClocksController {

}

const NSInteger kNumberClocksInDigit = 6;
const NSInteger kNumberClocksPerRow = 2;
const NSInteger kClockWidthInPix = 66;
const NSInteger kClockHeightInPix = 66;

//#pragma mark --> PUBLIC Property Synthesis Overrides

//#pragma mark --> PRIVAATE Property Synthesis Overrides

//#pragma mark --> CLASS (Static) Methods

//#pragma mark --> PUBLIC Property Overrides

#pragma mark --> PUBLIC Instance Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        DLog(@"");
        self.backgroundColor = [UIColor clearColor]; // cooment out to see color set in Storyboard file

        // setup our clock faces!
        NSMutableArray *clocksAr = [NSMutableArray arrayWithCapacity:kNumberClocksInDigit];
        NSInteger nColIdx = 0;
        CGRect rctClockFrame = CGRectMake(0, 0, kClockWidthInPix, kClockHeightInPix);
        for (int nItemCt = 1; nItemCt <= kNumberClocksInDigit; nItemCt++) {
            TADAnalogClock *nextFace = [[TADAnalogClock alloc] initWithFrame:rctClockFrame];
            nextFace.minutesDontAffectHourHand = YES;
            [clocksAr addObject:nextFace];
            [self addSubview:nextFace];
            nColIdx++;
            if(nColIdx < kNumberClocksPerRow)
            {
                // move right 1 clock
                rctClockFrame.origin.x += kClockWidthInPix;
            }
            else
            {
                nColIdx = 0;
                // back to left and move down 1 clock
                rctClockFrame.origin.x = 0;
                rctClockFrame.origin.y += kClockHeightInPix;
            }
        }
        self.analogClocksAr = clocksAr; // save our new list

        // setup our digits Encoding
        NSMutableArray *digitsAr = [NSMutableArray arrayWithCapacity:kNumberClocksInDigit];

        NSArray *zeroAr = [NSArray arrayWithObjects:
                           @"03:30:37",
                           @"09:30:37",
                           @"12:30:37",
                           @"06:00:37",
                           @"12:15:37",
                           @"12:45:37",
                           nil];
        [digitsAr addObject:zeroAr];
        NSArray *oneAr = [NSArray arrayWithObjects:
                          @"07:35:37",
                          @"06:30:37",
                          @"07:35:37",
                          @"12:30:37",
                          @"07:35:37",
                          @"12:00:37",
                          nil];
        [digitsAr addObject:oneAr];
        NSArray *twoAr = [NSArray arrayWithObjects:
                          @"03:15:37",
                          @"09:30:37",
                          @"06:15:37",
                          @"12:45:37",
                          @"12:15:37",
                          @"09:45:37",
                          nil];
        [digitsAr addObject:twoAr];
        NSArray *threeAr = [NSArray arrayWithObjects:
                            @"03:15:37",
                            @"06:45:37",
                            @"03:15:37",
                            @"09:00:30",
                            @"03:15:37",
                            @"09:00:37",
                            nil];
        [digitsAr addObject:threeAr];
        NSArray *fourAr = [NSArray arrayWithObjects:
                           @"06:30:37",
                           @"06:30:37",
                           @"12:15:37",
                           @"12:30:45",
                           @"07:35:37",
                           @"12:00:37",
                           nil];
        [digitsAr addObject:fourAr];
        NSArray *fiveAr = [NSArray arrayWithObjects:
                           @"03:30:37",
                           @"09:45:37",
                           @"12:15:37",
                           @"06:45:37",
                           @"03:15:37",
                           @"12:45:37",
                           nil];
        [digitsAr addObject:fiveAr];
        NSArray *sixAr = [NSArray arrayWithObjects:
                          @"03:30:37",
                          @"09:45:37",
                          @"12:30:15",
                          @"06:45:37",
                          @"03:00:37",
                          @"12:45:37",
                          nil];
        [digitsAr addObject:sixAr];
        NSArray *sevenAr = [NSArray arrayWithObjects:
                            @"03:15:37",
                            @"09:30:37",
                            @"07:35:37",
                            @"12:30:37",
                            @"07:35:37",
                            @"12:00:37",
                            nil];
        [digitsAr addObject:sevenAr];
        NSArray *eightAr = [NSArray arrayWithObjects:
                            @"06:15:37",
                            @"06:45:37",
                            @"03:00:30",
                            @"09:00:30",
                            @"03:00:37",
                            @"09:00:37",
                            nil];
        [digitsAr addObject:eightAr];
        NSArray *nineAr = [NSArray arrayWithObjects:
                           @"06:15:37",
                           @"06:45:37",
                           @"12:15:37",
                           @"12:30:45",
                           @"03:15:37",
                           @"12:45:37",
                           nil];
        [digitsAr addObject:nineAr];
        self.digits0thru9Ar = digitsAr; // save our new list
    }
    return self;
}

- (NSInteger)hoursFromTimeString:(NSString *)strTime
{
    NSAssert(strTime.length == 8, @"ERROR must have exactly formatted string 'HH:mm:ss'");
    NSInteger nHours = [[strTime substringToIndex:2] integerValue];
    return nHours;
}

- (NSInteger)minutesFromTimeString:(NSString *)strTime
{
    NSAssert(strTime.length == 8, @"ERROR must have exactly formatted string 'HH:mm:ss'");
    NSRange rngMinutes = NSMakeRange(3, 2);
    NSInteger nMinutes = [[strTime substringWithRange:rngMinutes] integerValue];
    return nMinutes;
}

- (NSInteger)secondsFromTimeString:(NSString *)strTime
{
    NSAssert(strTime.length == 8, @"ERROR must have exactly formatted string 'HH:mm:ss'");
    NSRange rngSeconds = NSMakeRange(6, 2);
    NSInteger nSeconds = [[strTime substringWithRange:rngSeconds] integerValue];
    return nSeconds;
}

- (NSDate *)timeForTimeString:(NSString *)strTime
{
    NSInteger nHours = [self hoursFromTimeString:strTime];
    NSInteger nMinutes = [self minutesFromTimeString:strTime];
    NSInteger nSeconds = [self secondsFromTimeString:strTime];

    NSDate *dtStartingTime = [NSDate date];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit |NSSecondCalendarUnit;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone localTimeZone];
    NSDateComponents *comps = [calendar components:unitFlags fromDate:dtStartingTime];
    comps.hour = nHours;
    comps.minute = nMinutes;
    comps.second = nSeconds;
    NSDate *dtDeisredTime = [calendar dateFromComponents:comps];
    return dtDeisredTime;
}

- (void)animateToTargetDigit
{
    DLog(@"");
    NSInteger nDesiredDigit = self.targetDigit0_9 % 10;

    NSArray *digitAr = [self.digits0thru9Ar objectAtIndex:nDesiredDigit];
    for (NSInteger nClockIdx = 0; nClockIdx < kNumberClocksInDigit; nClockIdx++) {
        NSString *currPseudoTime = [digitAr objectAtIndex:nClockIdx];
        NSDate *dtDesiredAnalogTime = [self timeForTimeString:currPseudoTime];
        TADAnalogClock *currClock = [self.analogClocksAr objectAtIndex:nClockIdx];
        currClock.targetTime = dtDesiredAnalogTime;
    }

    // now tell 'em all to move!
    for (TADAnalogClock *currClock in self.analogClocksAr) {
        [currClock animateToTargetTime];
    }
}

//#pragma mark --> Interface-builder Action Methods

//#pragma mark --> PRIVATE Property Overrides

//#pragma mark --> PRIVATE (Utility) Methods

@end
