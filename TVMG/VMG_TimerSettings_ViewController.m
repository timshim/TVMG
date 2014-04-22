//
//  VMG_TimerSettings_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 9/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_TimerSettings_ViewController.h"
#import "VMG_Meditate_ViewController.h"
#import "VMGAppDelegate.h"

@interface VMG_TimerSettings_ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *mins10_button;
@property (weak, nonatomic) IBOutlet UIButton *mins30_button;
@property (weak, nonatomic) IBOutlet UIButton *mins60_button;
@property (weak, nonatomic) IBOutlet UIButton *mins90_button;
@property (weak, nonatomic) IBOutlet UIButton *mins120_button;

@property BOOL mins10_selected;
@property BOOL mins30_selected;
@property BOOL mins60_selected;
@property BOOL mins90_selected;
@property BOOL mins120_selected;

@end

@implementation VMG_TimerSettings_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)minsPressed10:(id)sender
{
    if (self.mins10_selected == NO) {
        self.mins10_button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:35.0];
        self.mins10_selected = YES;
        VMGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.duration = 60 * 10;
    } else if (self.mins10_selected == YES) {
        self.mins10_button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:35.0];
        self.mins10_selected = NO;
    }
}

- (IBAction)minsPressed30:(id)sender
{
    if (self.mins30_selected == NO) {
        self.mins30_button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:35.0];
        self.mins30_selected = YES;
        VMGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.duration = 60 * 30;
    } else if (self.mins30_selected == YES) {
        self.mins30_button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:35.0];
        self.mins30_selected = NO;
    }
}

- (IBAction)minsPressed60:(id)sender
{
    if (self.mins60_selected == NO) {
        self.mins60_button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:35.0];
        self.mins60_selected = YES;
        VMGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.duration = 60 * 60;
    } else if (self.mins60_selected == YES) {
        self.mins60_button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:35.0];
        self.mins60_selected = NO;
    }
}

- (IBAction)minsPressed90:(id)sender
{
    if (self.mins90_selected == NO) {
        self.mins90_button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:35.0];
        self.mins90_selected = YES;
        VMGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.duration = 60 * 90;
    } else if (self.mins90_selected == YES) {
        self.mins90_button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:35.0];
        self.mins90_selected = NO;
    }
}

- (IBAction)minsPressed120:(id)sender
{
    if (self.mins120_selected == NO) {
        self.mins120_button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:35.0];
        self.mins120_selected = YES;
        VMGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.duration = 60 * 120;
    } else if (self.mins120_selected == YES) {
        self.mins120_button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:35.0];
        self.mins120_selected = NO;
    }
}

- (IBAction)timerSettingsDonePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
