//
//  VMG_Login_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 8/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_Login_ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface VMG_Login_ViewController ()

@end

@implementation VMG_Login_ViewController

@synthesize logoIcon;
@synthesize fieldsBackground;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"LoginBackground.png"]]];
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) {
            [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"LoginBackground~ipad.png"]]];
            self.logInView.layer.contents = (id)[UIImage imageNamed:@"LoginBackground~ipad.png"].CGImage;
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft) {
            [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"LoginBackground~ipad.png"]]];
            self.logInView.layer.contents = (id)[UIImage imageNamed:@"LoginBackground~ipad.png"].CGImage;
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight) {
            [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"LoginBackground~ipad.png"]]];
            self.logInView.layer.contents = (id)[UIImage imageNamed:@"LoginBackground~ipad.png"].CGImage;
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown) {
            [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"LoginBackground~ipad.png"]]];
            self.logInView.layer.contents = (id)[UIImage imageNamed:@"LoginBackground~ipad.png"].CGImage;
        }
    }
    
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LogoText.png"]]];
    
    // Add login field background
    fieldsBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginFieldsBackground.png"]];
    [self.logInView addSubview:self.fieldsBackground];
    [self.logInView sendSubviewToBack:self.fieldsBackground];
    
    logoIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LogoIcon.png"]];
    [self.logInView addSubview:self.logoIcon];
    [self.logInView sendSubviewToBack:self.logoIcon];
    
    // Remove text shadow
    CALayer *layer = self.logInView.usernameField.layer;
    layer.shadowOpacity = 0.0f;
    layer = self.logInView.passwordField.layer;
    layer.shadowOpacity = 0.0f;
    layer = self.logInView.signUpLabel.layer;
    layer.shadowOpacity = 0.0f;
    
    // Set field text color
    [self.logInView.usernameField setTextColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0]];
    [self.logInView.passwordField setTextColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0]];
    [self.logInView.signUpLabel setTextColor:[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0]];
    [self.logInView.usernameField setFont:[UIFont fontWithName:@"GillSans-Light" size:22.0]];
    [self.logInView.passwordField setFont:[UIFont fontWithName:@"GillSans-Light" size:22.0]];
    [self.logInView.signUpLabel setFont:[UIFont fontWithName:@"GillSans-Light" size:13.0]];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // Set buttons appearance
    [self.logInView.signUpButton setBackgroundImage:[UIImage imageNamed:@"SignupButton.png"] forState:UIControlStateNormal];
    [self.logInView.signUpButton setBackgroundImage:[UIImage imageNamed:@"SignupButton_Down.png"] forState:UIControlStateHighlighted];
    [self.logInView.signUpButton setTitle:@"" forState:UIControlStateNormal];
    [self.logInView.signUpButton setTitle:@"" forState:UIControlStateHighlighted];
    
    [self.logInView.logInButton setImage:[UIImage imageNamed:@"LoginButton.png"] forState:UIControlStateNormal];
    [self.logInView.logInButton setImage:[UIImage imageNamed:@"LoginButton_Down.png"] forState:UIControlStateHighlighted];
    [self.logInView.logInButton setTitle:@"" forState:UIControlStateNormal];
    [self.logInView.logInButton setTitle:@"" forState:UIControlStateHighlighted];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        CGSize screenSize = screenBound.size;
        CGFloat screenWidth = screenSize.width;
        CGFloat screenHeight = screenSize.height;
        CGFloat screenCenterX = screenWidth/2;
        CGFloat screenCenterY = screenHeight/2;
        // Set frame for elements
        [self.logInView.logo setFrame:CGRectMake(23.0f, 100.0f, 270.0f, 72.0f)];
        [self.logInView.logInButton setFrame:CGRectMake(45.0f, 310.0f, 225.0f, 50.0f)];
        [self.logInView.signUpButton setFrame:CGRectMake(45.0f, 410.0f, 225.0f, 50.0f)];
        [self.logInView.usernameField setFrame:CGRectMake(45.0f, 190.0f, 225.0f, 50.0f)];
        [self.logInView.passwordField setFrame:CGRectMake(45.0f, 240.0f, 225.0f, 50.0f)];
        [self.fieldsBackground setFrame:CGRectMake(45.0f, 190.0f, 225.0f, 100.0f)];
        [self.logInView.signUpLabel setFrame:CGRectMake(45.0f, 370.0f, 225.0f, 50.0f)];
        [self.logoIcon setFrame:CGRectMake(screenCenterX-30, screenCenterY*0.13, 60.0f, 60.0f)];
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft) {
            CGRect screenBound = [[UIScreen mainScreen] bounds];
            CGSize screenSize = screenBound.size;
            CGFloat screenWidth = screenSize.width;
            CGFloat screenHeight = screenSize.height;
            CGFloat screenCenterX = screenWidth/2;
            CGFloat screenCenterY = screenHeight/2;
            // Set frame for elements
            [self.logInView.logo setFrame:CGRectMake(screenCenterX, screenCenterY*0.31, 270.0f, 72.0f)];
            [self.logInView.logInButton setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.51+110, 225.0f, 50.0f)];
            [self.logInView.signUpButton setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.523+230, 225.0f, 50.0f)];
            [self.logInView.usernameField setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.504, 225.0f, 50.0f)];
            [self.logInView.passwordField setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.504+50, 225.0f, 50.0f)];
            [self.fieldsBackground setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.5, 225.0f, 100.0f)];
            [self.logInView.signUpLabel setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.523+190, 225.0f, 50.0f)];
            [self.logoIcon setFrame:CGRectMake(screenCenterX+84, screenCenterY*0.13, 84.0f, 84.0f)];
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight) {
            CGRect screenBound = [[UIScreen mainScreen] bounds];
            CGSize screenSize = screenBound.size;
            CGFloat screenWidth = screenSize.width;
            CGFloat screenHeight = screenSize.height;
            CGFloat screenCenterX = screenWidth/2;
            CGFloat screenCenterY = screenHeight/2;
            // Set frame for elements
            [self.logInView.logo setFrame:CGRectMake(screenCenterX, screenCenterY*0.31, 270.0f, 72.0f)];
            [self.logInView.logInButton setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.51+110, 225.0f, 50.0f)];
            [self.logInView.signUpButton setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.523+230, 225.0f, 50.0f)];
            [self.logInView.usernameField setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.504, 225.0f, 50.0f)];
            [self.logInView.passwordField setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.504+50, 225.0f, 50.0f)];
            [self.fieldsBackground setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.5, 225.0f, 100.0f)];
            [self.logInView.signUpLabel setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.523+190, 225.0f, 50.0f)];
            [self.logoIcon setFrame:CGRectMake(screenCenterX+84, screenCenterY*0.13, 84.0f, 84.0f)];
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) {
            CGRect screenBound = [[UIScreen mainScreen] bounds];
            CGSize screenSize = screenBound.size;
            CGFloat screenWidth = screenSize.width;
            CGFloat screenHeight = screenSize.height;
            CGFloat screenCenterX = screenWidth/2;
            CGFloat screenCenterY = screenHeight/2;
            // Set frame for elements
            [self.logInView.logo setFrame:CGRectMake(screenCenterX-270/2, screenCenterY*0.31, 270.0f, 72.0f)];
            [self.logInView.logInButton setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.51+110, 225.0f, 50.0f)];
            [self.logInView.signUpButton setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.523+230, 225.0f, 50.0f)];
            [self.logInView.usernameField setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.504, 225.0f, 50.0f)];
            [self.logInView.passwordField setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.504+50, 225.0f, 50.0f)];
            [self.fieldsBackground setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.5, 225.0f, 100.0f)];
            [self.logInView.signUpLabel setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.523+190, 225.0f, 50.0f)];
            [self.logoIcon setFrame:CGRectMake(screenCenterX-42, screenCenterY*0.13, 84.0f, 84.0f)];
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGRect screenBound = [[UIScreen mainScreen] bounds];
            CGSize screenSize = screenBound.size;
            CGFloat screenWidth = screenSize.width;
            CGFloat screenHeight = screenSize.height;
            CGFloat screenCenterX = screenWidth/2;
            CGFloat screenCenterY = screenHeight/2;
            // Set frame for elements
            [self.logInView.logo setFrame:CGRectMake(screenCenterX-270/2, screenCenterY*0.31, 270.0f, 72.0f)];
            [self.logInView.logInButton setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.51+110, 225.0f, 50.0f)];
            [self.logInView.signUpButton setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.523+230, 225.0f, 50.0f)];
            [self.logInView.usernameField setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.504, 225.0f, 50.0f)];
            [self.logInView.passwordField setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.504+50, 225.0f, 50.0f)];
            [self.fieldsBackground setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.5, 225.0f, 100.0f)];
            [self.logInView.signUpLabel setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.523+190, 225.0f, 50.0f)];
            [self.logoIcon setFrame:CGRectMake(screenCenterX-42, screenCenterY*0.13, 84.0f, 84.0f)];
        }
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
