//
//  VMG_Meditate_ViewController.h
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWGCircleCounter.h"
#import "MZTimerLabel.h"

@interface VMG_Meditate_ViewController : UIViewController <JWGCircleCounterDelegate, MZTimerLabelDelegate> {
    MZTimerLabel *mainTimer;
}

@property (strong, nonatomic) IBOutlet JWGCircleCounter *circleCounter;

@property (weak, nonatomic) IBOutlet UILabel *timerHoursMinutes;

@property (weak, nonatomic) IBOutlet UIButton *timerSettingsButton;

- (IBAction)resetCountDown:(id)sender;

@end
