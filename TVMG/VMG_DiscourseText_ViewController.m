//
//  VMG_DiscourseText_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 24/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_DiscourseText_ViewController.h"
#import "FTCoreTextView.h"

@interface VMG_DiscourseText_ViewController ()

@property (nonatomic) dispatch_source_t timerSource;
@property (strong, nonatomic) NSString *textFile;

@end

@implementation VMG_DiscourseText_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.discourseContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 80)];
    
    self.discourseTextView = [[UIScrollView alloc] initWithFrame:self.discourseContentView.bounds];
    
    self.discourseCoreTextView = [[FTCoreTextView alloc] initWithFrame:CGRectInset(self.discourseTextView.bounds, 20.0f, 0)];
    self.discourseCoreTextView.backgroundColor = [UIColor clearColor];
    
    [self.discourseCoreTextView addStyles:[self coreTextStyle]];
    
    [self.discourseTextView addSubview:self.discourseCoreTextView];
    [self.discourseContentView addSubview:self.discourseTextView];
    [self.view addSubview:self.discourseContentView];
    [self.view addSubview:self.audioBarView];
    
    // Fill in content
    switch (self.discourseSelected) {
            
        case 0:
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"forewordText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Foreword";
            self.audioBarView.hidden = YES;
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 1:
            self.playerControl.duration = 4327;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dayOneText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 1";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D01-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 2:
            self.playerControl.duration = 4576;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dayTwoText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 2";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D02-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 3:
            self.playerControl.duration = 3976;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dayThreeText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 3";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D03-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 4:
            self.playerControl.duration = 4111;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dayFourText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 4";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D04-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 5:
            self.playerControl.duration = 3859;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dayFiveText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 5";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D05-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 6:
            self.playerControl.duration = 3901;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"daySixText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 6";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D06-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 7:
            self.playerControl.duration = 3961;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"daySevenText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 7";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D07-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 8:
            self.playerControl.duration = 3779;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dayEightText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 8";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D08-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 9:
            self.playerControl.duration = 3886;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dayNineText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 9";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D09-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 10:
            self.playerControl.duration = 4004;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dayTenText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 10";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D10-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
            
        case 11:
            self.playerControl.duration = 4681;
            self.textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dayElevenText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
            self.discourseTitle.text = @"Day 11";
            self.contentAudioLink = @"https://s3.amazonaws.com/tvmg/10Day-D11-English.mp3";
            self.discourseCoreTextView.text = self.textFile;
            break;
    }

    self.MPaudioPlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:self.contentAudioLink]];
    
    NSError *setCategoryError = nil;
    NSError *activationError = nil;
    [[AVAudioSession sharedInstance] setActive:YES error:&activationError];
    [[AVAudioSession sharedInstance] setDelegate:self];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&setCategoryError];
    
    self.playerControl.delegate = self;
    
    self.playerControl.progressTrackRatio = 0.25f;
    self.playerControl.trackTintColor = [UIColor clearColor];
    self.playerControl.highlightedTrackTintColor = [UIColor clearColor];
    self.playerControl.disabledTrackTintColor = [UIColor clearColor];
    self.playerControl.progressTintColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    self.playerControl.highlightedProgressTintColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    self.playerControl.disabledProgressTintColor = [UIColor lightGrayColor];
    self.playerControl.buttonTopTintColor = [UIColor clearColor];
    self.playerControl.highlightedButtonTopTintColor = [UIColor clearColor];
    self.playerControl.disabledButtonTopTintColor = [UIColor clearColor];
    self.playerControl.buttonBottomTintColor = [UIColor clearColor];
    self.playerControl.highlightedButtonBottomTintColor = [UIColor clearColor];
    self.playerControl.disabledButtonBottomTintColor = [UIColor clearColor];
    self.playerControl.iconColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    self.playerControl.highlightedIconColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    self.playerControl.disabledIconColor = [UIColor lightGrayColor];
    self.playerControl.borderColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    self.playerControl.highlightedBorderColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    self.playerControl.disabledBorderColor = [UIColor lightGrayColor];
    self.playerControl.borderWidth = 1.0f;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
    
    [super viewWillDisappear:animated];
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)receivedEvent {
    
    if (receivedEvent.type == UIEventTypeRemoteControl) {
        switch (receivedEvent.subtype) {
            case UIEventSubtypeRemoteControlPlay:
                [self.MPaudioPlayer play];
                break;
            case UIEventSubtypeRemoteControlPause:
                [self.MPaudioPlayer pause];
                break;
            case UIEventSubtypeRemoteControlTogglePlayPause:
                if (self.MPaudioPlayer.playbackState == MPMoviePlaybackStatePlaying) {
                    [self.MPaudioPlayer pause];
                }
                else {
                    [self.MPaudioPlayer play];
                }
                break;
            default:
                break;
        }
    }
}

- (void)startControl
{
    self.timerSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(self.timerSource, dispatch_time(DISPATCH_TIME_NOW, 0), NSEC_PER_SEC / 10.0, 0.0);
    dispatch_source_set_event_handler(self.timerSource, ^{
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           NSTimeInterval time = self.playerControl.currentTime + 1.0 / 10.0;
                           self.playerControl.currentTime = time;
                           
                           if (self.playerControl.currentTime >= self.playerControl.duration && NULL != self.timerSource)
                           {
                               [self stopControl];
                               self.playerControl.playing = NO;
                               self.playerControl.currentTime = 0.0;
                           }
                       });
    });
    dispatch_source_set_cancel_handler(self.timerSource, ^{
        if (self.timerSource){
            self.timerSource = NULL;
        }
    });
    dispatch_resume(self.timerSource);
}

- (void)stopControl
{
    if (self.timerSource){
        dispatch_source_cancel(self.timerSource);
    }
}

- (IBAction)didTouchUpInside:(id)sender
{
    if (self.MPaudioPlayer.playbackState == MPMoviePlaybackStatePlaying) {
        [self.MPaudioPlayer stop];
        self.MPaudioPlayer.currentPlaybackTime = 0.0;
        self.playerControl.playing = NO;
        NSLog(@"Stopped");
    } else {
        [self.MPaudioPlayer play];
        self.playerControl.playing = YES;
        NSLog(@"Started");
    }
}

- (void)moviePlayerPlaybackStateDidChange:(NSNotification*)notification
{
    if (self.MPaudioPlayer.playbackState == MPMoviePlaybackStateStopped) {
        self.playerControl.playing = YES;
    }
}

#pragma mark - EECircularMusicPlayerControlDelegate
- (NSTimeInterval)currentTime
{
    return self.MPaudioPlayer.currentPlaybackTime;
}

#pragma mark - FTCoreText
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //  We need to recalculate fit height on every layout because
    //  when the device orientation changes, the FTCoreText's width changes
    
    //  Make the FTCoreTextView to automatically adjust it's height
    //  so it fits all its rendered text using the actual width
	[self.discourseCoreTextView fitToSuggestedHeight];
    
    //  Adjust the scroll view's content size so it can scroll all
    //  the FTCoreTextView's content
    [self.discourseTextView setContentSize:CGSizeMake(CGRectGetWidth(self.discourseTextView.bounds), CGRectGetMaxY(self.discourseCoreTextView.frame)+20.0f)];
}

#pragma mark FTCoreText Styling

- (NSArray *)coreTextStyle
{
    NSMutableArray *result = [NSMutableArray array];
    
    //  This will be default style of the text not closed in any tag
	FTCoreTextStyle *defaultStyle = [FTCoreTextStyle new];
	defaultStyle.name = FTCoreTextTagDefault;	//thought the default name is already set to FTCoreTextTagDefault
	defaultStyle.font = [UIFont fontWithName:@"GillSans-Light" size:20.0f];
	defaultStyle.textAlignment = FTCoreTextAlignementLeft;
    defaultStyle.color = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.8f];
    defaultStyle.minLineHeight = 30.0;
    defaultStyle.maxLineHeight = 30.0;
	[result addObject:defaultStyle];
	
    //  Create style using convenience method
	FTCoreTextStyle *titleStyle = [FTCoreTextStyle styleWithName:@"title"];
	titleStyle.font = [UIFont fontWithName:@"GillSans-Light" size:30.f];
	titleStyle.textAlignment = FTCoreTextAlignementLeft;
	[result addObject:titleStyle];
	
    //  Image will be centered
	FTCoreTextStyle *imageStyle = [FTCoreTextStyle new];
	imageStyle.name = FTCoreTextTagImage;
    imageStyle.paragraphInset = UIEdgeInsetsMake(0, 5.0f, 0, 0);
	[result addObject:imageStyle];
	
	FTCoreTextStyle *firstLetterStyle = [FTCoreTextStyle new];
	firstLetterStyle.name = @"firstLetter";
	firstLetterStyle.font = [UIFont fontWithName:@"GillSans-Light" size:20.f];
	[result addObject:firstLetterStyle];
	
    //  This is the link style
    //  Notice that you can make copy of FTCoreTextStyle
    //  and just change any required properties
	FTCoreTextStyle *linkStyle = [defaultStyle copy];
	linkStyle.name = FTCoreTextTagLink;
	linkStyle.color = [UIColor whiteColor];
    linkStyle.underlined = YES;
	[result addObject:linkStyle];
	
	FTCoreTextStyle *subtitleStyle = [FTCoreTextStyle styleWithName:@"subtitle"];
	subtitleStyle.font = [UIFont fontWithName:@"GillSans-Light" size:25.0f];
	subtitleStyle.color = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.8f];
	[result addObject:subtitleStyle];
	
    //  This will be list of items
    //  You can specify custom style for a bullet
	FTCoreTextStyle *bulletStyle = [defaultStyle copy];
	bulletStyle.name = FTCoreTextTagBullet;
	bulletStyle.bulletFont = [UIFont fontWithName:@"GillSans-Light" size:20.0f];
	bulletStyle.bulletColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.8f];
	bulletStyle.bulletCharacter = @"";
	bulletStyle.paragraphInset = UIEdgeInsetsMake(0, 30.0f, 0, 0);
	[result addObject:bulletStyle];
    
    FTCoreTextStyle *italicStyle = [defaultStyle copy];
	italicStyle.name = @"italic";
    italicStyle.font = [UIFont fontWithName:@"GillSans-LightItalic" size:20.0f];
	[result addObject:italicStyle];
    
    FTCoreTextStyle *underlineStyle = [defaultStyle copy];
	underlineStyle.name = @"underline";
    underlineStyle.font = [UIFont fontWithName:@"GillSans-Light" size:20.0f];
    underlineStyle.underlined = YES;
	[result addObject:underlineStyle];
    
    FTCoreTextStyle *boldStyle = [defaultStyle copy];
	boldStyle.name = @"bold";
    boldStyle.font = [UIFont fontWithName:@"GillSans" size:20.0f];
	[result addObject:boldStyle];
    
    FTCoreTextStyle *coloredStyle = [defaultStyle copy];
    [coloredStyle setName:@"colored"];
    [coloredStyle setColor:[UIColor redColor]];
	[result addObject:coloredStyle];
    
    return  result;
}
@end
