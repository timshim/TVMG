//
//  VMG_Meditate_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_Meditate_ViewController.h"
#import "JWGCircleCounter.h"
#import "VMGAppDelegate.h"
#import "PXAlertView.h"

@interface VMG_Meditate_ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation VMG_Meditate_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    VMGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.duration = 1;
	
    self.circleCounter.delegate = self;
    
    mainTimer = [[MZTimerLabel alloc] initWithLabel:_timerHoursMinutes andTimerType:MZTimerLabelTypeTimer];
}

- (void)viewDidAppear:(BOOL)animated
{
    VMGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    [mainTimer setCountDownTime:appDelegate.duration];
}

- (IBAction)startButtonAction:(id)sender
{
    VMGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.timerSettingsButton.enabled = NO;
    
    if (![self.circleCounter didStart] || [self.circleCounter didFinish]) {
        [self.circleCounter startWithSeconds:appDelegate.duration-(appDelegate.duration/10)];
        [mainTimer start];
        [self.startButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
    else if ([self.circleCounter isRunning]) {
        [self.circleCounter stop];
        [mainTimer pause];
        self.timerSettingsButton.enabled = YES;
        [self.startButton setTitle:@"Resume" forState:UIControlStateNormal];
    }
    else {
        [self.circleCounter resume];
        [mainTimer start];
        [self.startButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
}

- (void)circleCounterTimeDidExpire:(JWGCircleCounter *)circleCounter
{
    [self resetCountDown:nil];
    [mainTimer reset];
    self.timerSettingsButton.enabled = YES;
    
    [PXAlertView showAlertWithTitle:@"Bhavatu Sabba Mangalam"
                            message:@"Take rest ..."
                        cancelTitle:@"Sadhu"
                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                         }];
}

- (IBAction)resetCountDown:(id)sender
{
    [mainTimer reset];
    if ([mainTimer counting]) {
        [mainTimer pause];
    }
    self.timerSettingsButton.enabled = YES;
    [self.circleCounter reset];
    
    if (![mainTimer counting] && ![self.circleCounter isRunning]) {
        [self.startButton setTitle:@"Start Meditation" forState:UIControlStateNormal];
    }
}

- (IBAction)timerSettingsPressed:(id)sender
{
    [self performSegueWithIdentifier:@"timerSettings" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"timerSettings"])
    {
        NSLog(@"timerSettings success");
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end