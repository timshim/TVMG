//
//  VMG_Meditate_ViewController.h
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "ZGCountDownTimer.h"

@interface VMG_Meditate_ViewController : UIViewController <AVAudioPlayerDelegate, AVAudioSessionDelegate, ZGCountDownTimerDelegate>

@property(nonatomic, strong) ZGCountDownTimer *countDownTimer;
@property (weak, nonatomic) IBOutlet UILabel *timerHoursMinutes;
@property (weak, nonatomic) IBOutlet UIButton *timerSettingsButton;
@property (nonatomic, retain) MPMoviePlayerController *guidedMeditationAudio;
@property (nonatomic, retain) AVQueuePlayer *queueAudio;
@property (nonatomic, strong) NSURL *guidedMeditation_intro_url;
@property (nonatomic, strong) NSURL *guidedMeditation_end_url;
@property(nonatomic, strong) UILocalNotification *localNotification;

- (IBAction)resetCountDown:(id)sender;

@end
