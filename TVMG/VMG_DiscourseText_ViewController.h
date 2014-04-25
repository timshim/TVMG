//
//  VMG_DiscourseText_ViewController.h
//  TVMG
//
//  Created by Tim Shim on 24/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "EECircularMusicPlayerControl.h"

@class FTCoreTextView;

@interface VMG_DiscourseText_ViewController : UIViewController <EECircularMusicPlayerControlDelegate, AVAudioPlayerDelegate, AVAudioSessionDelegate>

@property (weak, nonatomic) IBOutlet UILabel *discourseTitle;
@property (strong, nonatomic) IBOutlet UIView *discourseContentView;
@property (strong, nonatomic) IBOutlet UIScrollView *discourseTextView;
@property (strong, nonatomic) FTCoreTextView *discourseCoreTextView;
@property (strong, nonatomic) IBOutlet UIView *audioBarView;

@property (strong, nonatomic) IBOutlet EECircularMusicPlayerControl *playerControl;
@property (nonatomic, retain) MPMoviePlayerController *MPaudioPlayer;

@property NSInteger discourseSelected;
@property NSString *contentAudioLink;

- (IBAction)didTouchUpInside:(id)sender;

@end
