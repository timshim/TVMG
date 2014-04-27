//
//  VMG_Meditate_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_Meditate_ViewController.h"
#import "VMGAppDelegate.h"
#import "PXAlertView.h"

#define kDefaultCountDownNotificationKey @"countDownNotificationKey"

@interface VMG_Meditate_ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation VMG_Meditate_ViewController

@synthesize queueAudio;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    VMGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.duration = 60*12;
    
    self.guidedMeditation_intro_url = [[NSBundle mainBundle] URLForResource:@"goenka_guidedMeditation_intro" withExtension:@"mp3"];
    self.guidedMeditation_end_url = [[NSBundle mainBundle] URLForResource:@"goenka_guidedMeditation_end_01" withExtension:@"mp3"];
    self.queueAudio = [[AVQueuePlayer alloc] initWithURL:self.guidedMeditation_end_url];
    
    NSError *setCategoryError = nil;
    NSError *activationError = nil;
    [[AVAudioSession sharedInstance] setActive:YES error:&activationError];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&setCategoryError];
    
    self.countDownTimer = [ZGCountDownTimer countDownTimerWithIdentifier:@"countdownTimer"];
    self.countDownTimer.delegate = self;
    [self.countDownTimer setTotalCountDownTime:appDelegate.duration];
}

- (void)secondUpdated:(ZGCountDownTimer *)sender countDownTimePassed:(NSTimeInterval)timePassed ofTotalTime:(NSTimeInterval)totalTime {
    self.timerHoursMinutes.text = [ZGCountDownTimer getDateStringForTimeInterval:(totalTime - timePassed)];
}

- (UILocalNotification *)localNotification {
    if (!_localNotification) {
        NSArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
        for (UILocalNotification *noti in localNotifications) {
            NSString *identifier = [noti.userInfo valueForKey:kDefaultCountDownNotificationKey];
            if ([identifier isEqualToString:self.tabBarItem.title]) {
                _localNotification = noti;
                return _localNotification;
            }
        }
        _localNotification = [[UILocalNotification alloc] init];
        _localNotification.userInfo = @{kDefaultCountDownNotificationKey : self.tabBarItem.title};
        _localNotification.alertBody = [NSString stringWithFormat:@"Bhavatu Sabba Mangalam"];
        _localNotification.soundName = @"gongNotification.mp3";
    }
    return _localNotification;
}

- (void)viewDidAppear:(BOOL)animated
{
    VMGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    [self.countDownTimer setTotalCountDownTime:appDelegate.duration];
}

- (IBAction)startButtonAction:(id)sender
{
    if (!_guidedMeditationAudio) {
        self.guidedMeditationAudio = [[MPMoviePlayerController alloc] initWithContentURL:self.guidedMeditation_intro_url];
    }
    
    self.timerSettingsButton.enabled = NO;
    
    if (!self.countDownTimer.isRunning) {
        [self.countDownTimer startCountDown];
        self.localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:(self.countDownTimer.totalCountDownTime - self.countDownTimer.timePassed)];
        [[UIApplication sharedApplication] scheduleLocalNotification:self.localNotification];
        [self.guidedMeditationAudio play];
        [self.startButton setTitle:@"Pause" forState:UIControlStateNormal];
    } else if (self.countDownTimer.isRunning) {
        [self.countDownTimer pauseCountDown];
        [[UIApplication sharedApplication] cancelLocalNotification:self.localNotification];
        [self.guidedMeditationAudio pause];
        self.timerSettingsButton.enabled = YES;
        [self.startButton setTitle:@"Resume" forState:UIControlStateNormal];
    } else {
        [self.countDownTimer startCountDown];
        self.localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:(self.countDownTimer.totalCountDownTime - self.countDownTimer.timePassed)];
        [[UIApplication sharedApplication] scheduleLocalNotification:self.localNotification];
        [self.guidedMeditationAudio play];
        [self.startButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
}

- (void)countDownCompleted:(ZGCountDownTimer *)sender
{
    [self.countDownTimer resetCountDown];
    [[UIApplication sharedApplication] cancelLocalNotification:self.localNotification];
    self.timerSettingsButton.enabled = YES;
    [self.startButton setTitle:@"Start Meditation" forState:UIControlStateNormal];
    self.guidedMeditationAudio = nil;
    [self.queueAudio play];
    
    [PXAlertView showAlertWithTitle:@"Bhavatu Sabba Mangalam"
                            message:@"Take rest ..."
                        cancelTitle:@"Sadhu"
                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                             [self.countDownTimer resetCountDown];
                             [self.queueAudio pause];
                             [self.queueAudio seekToTime:CMTimeMake(1, 10)];
                         }];
}

- (IBAction)resetCountDown:(id)sender
{
    [self.countDownTimer resetCountDown];
    [[UIApplication sharedApplication] cancelLocalNotification:self.localNotification];
    [self.startButton setTitle:@"Start Meditation" forState:UIControlStateNormal];
    [self.guidedMeditationAudio stop];
    self.guidedMeditationAudio = nil;
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