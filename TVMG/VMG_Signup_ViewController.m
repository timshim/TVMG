//
//  VMG_Signup_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 8/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_Signup_ViewController.h"

@interface VMG_Signup_ViewController ()

@end

@implementation VMG_Signup_ViewController

@synthesize logoIcon;
@synthesize fieldsBackground;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self.signUpView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SignupBackground.png"]]];
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) {
            [self.signUpView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SignupBackground~ipad.png"]]];
            self.signUpView.layer.contents = (id)[UIImage imageNamed:@"SignupBackground~ipad.png"].CGImage;
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft) {
            [self.signUpView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SignupBackground~ipad.png"]]];
            self.signUpView.layer.contents = (id)[UIImage imageNamed:@"SignupBackground~ipad.png"].CGImage;
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight) {
            [self.signUpView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SignupBackground~ipad.png"]]];
            self.signUpView.layer.contents = (id)[UIImage imageNamed:@"SignupBackground~ipad.png"].CGImage;
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown) {
            [self.signUpView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SignupBackground~ipad.png"]]];
            self.signUpView.layer.contents = (id)[UIImage imageNamed:@"SignupBackground~ipad.png"].CGImage;
        }
    }
    
    [self.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LogoText.png"]]];
    
    // Add login field background
    fieldsBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SignupFieldsBackground.png"]];
    [self.signUpView addSubview:self.fieldsBackground];
    [self.signUpView sendSubviewToBack:self.fieldsBackground];
    
    logoIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LogoIcon_Signup.png"]];
    [self.signUpView addSubview:self.logoIcon];
    [self.signUpView sendSubviewToBack:self.logoIcon];
    
    // Remove text shadow
    CALayer *layer = self.signUpView.usernameField.layer;
    layer.shadowOpacity = 0.0f;
    layer = self.signUpView.passwordField.layer;
    layer.shadowOpacity = 0.0f;
    
    // Set field text color
    [self.signUpView.usernameField setTextColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0]];
    [self.signUpView.passwordField setTextColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0]];
    [self.signUpView.emailField setTextColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0]];
    [self.signUpView.usernameField setFont:[UIFont fontWithName:@"GillSans-Light" size:22.0]];
    [self.signUpView.passwordField setFont:[UIFont fontWithName:@"GillSans-Light" size:22.0]];
    [self.signUpView.emailField setFont:[UIFont fontWithName:@"GillSans-Light" size:22.0]];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // Set buttons appearance
    [self.signUpView.signUpButton setBackgroundImage:[UIImage imageNamed:@"CreateProfileButton.png"] forState:UIControlStateNormal];
    [self.signUpView.signUpButton setBackgroundImage:[UIImage imageNamed:@"CreateProfileButton_Down.png"] forState:UIControlStateHighlighted];
    [self.signUpView.signUpButton setTitle:@"" forState:UIControlStateNormal];
    [self.signUpView.signUpButton setTitle:@"" forState:UIControlStateHighlighted];
    
    [self.signUpView.dismissButton setImage:[UIImage imageNamed:@"Logout Icon.png"] forState:UIControlStateNormal];
    [self.signUpView.dismissButton setTitle:@"" forState:UIControlStateNormal];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        CGSize screenSize = screenBound.size;
        CGFloat screenWidth = screenSize.width;
        CGFloat screenHeight = screenSize.height;
        CGFloat screenCenterX = screenWidth/2;
        CGFloat screenCenterY = screenHeight/2;
        // Set frame for elements
        [self.signUpView.logo setFrame:CGRectMake(23.0, 100.0, 270.0f, 72.0f)];
        [self.signUpView.dismissButton setFrame:CGRectMake(10.0, 23.0, 30.0f, 30.0f)];
        [self.signUpView.signUpButton setFrame:CGRectMake(45.0f, 360.0f, 225.0f, 50.0f)];
        [self.signUpView.usernameField setFrame:CGRectMake(45.0f, 190.0f, 225.0f, 50.0f)];
        [self.signUpView.passwordField setFrame:CGRectMake(45.0f, 240.0f, 225.0f, 50.0f)];
        [self.signUpView.emailField setFrame:CGRectMake(45.0f, 290.0f, 225.0f, 50.0f)];
        [self.fieldsBackground setFrame:CGRectMake(45.0f, 190.0f, 225.0f, 150.0f)];
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
            [self.signUpView.logo setFrame:CGRectMake(screenCenterX, screenCenterY*0.31, 270.0f, 72.0f)];
            [self.signUpView.signUpButton setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.523+155, 225.0f, 50.0f)];
            [self.signUpView.usernameField setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.504, 225.0f, 50.0f)];
            [self.signUpView.passwordField setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.504+50, 225.0f, 50.0f)];
            [self.logoIcon setFrame:CGRectMake(screenCenterX+84, screenCenterY*0.13, 84.0f, 84.0f)];
            [self.signUpView.dismissButton setFrame:CGRectMake(18.0, 32.0, 30.0f, 30.0f)];
            [self.signUpView.emailField setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.504+100, 225.0f, 50.0f)];
            [self.fieldsBackground setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.5, 225.0f, 150.0f)];
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight) {
            CGRect screenBound = [[UIScreen mainScreen] bounds];
            CGSize screenSize = screenBound.size;
            CGFloat screenWidth = screenSize.width;
            CGFloat screenHeight = screenSize.height;
            CGFloat screenCenterX = screenWidth/2;
            CGFloat screenCenterY = screenHeight/2;
            // Set frame for elements
            [self.signUpView.logo setFrame:CGRectMake(screenCenterX, screenCenterY*0.31, 270.0f, 72.0f)];
            [self.signUpView.signUpButton setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.523+155, 225.0f, 50.0f)];
            [self.signUpView.usernameField setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.504, 225.0f, 50.0f)];
            [self.signUpView.passwordField setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.504+50, 225.0f, 50.0f)];
            [self.logoIcon setFrame:CGRectMake(screenCenterX+84, screenCenterY*0.13, 84.0f, 84.0f)];
            [self.signUpView.dismissButton setFrame:CGRectMake(18.0, 32.0, 30.0f, 30.0f)];
            [self.signUpView.emailField setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.504+100, 225.0f, 50.0f)];
            [self.fieldsBackground setFrame:CGRectMake(screenCenterX+22, screenCenterY*0.5, 225.0f, 150.0f)];
        }
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) {
            CGRect screenBound = [[UIScreen mainScreen] bounds];
            CGSize screenSize = screenBound.size;
            CGFloat screenWidth = screenSize.width;
            CGFloat screenHeight = screenSize.height;
            CGFloat screenCenterX = screenWidth/2;
            CGFloat screenCenterY = screenHeight/2;
            // Set frame for elements
            [self.signUpView.logo setFrame:CGRectMake(screenCenterX-270/2, screenCenterY*0.31, 270.0f, 72.0f)];
            [self.signUpView.signUpButton setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.523+155, 225.0f, 50.0f)];
            [self.signUpView.usernameField setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.504, 225.0f, 50.0f)];
            [self.signUpView.passwordField setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.504+50, 225.0f, 50.0f)];
            [self.signUpView.dismissButton setFrame:CGRectMake(18.0, 32.0, 30.0f, 30.0f)];
            [self.signUpView.emailField setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.504+100, 225.0f, 50.0f)];
            [self.fieldsBackground setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.5, 225.0f, 150.0f)];
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
            [self.signUpView.logo setFrame:CGRectMake(screenCenterX-270/2, screenCenterY*0.31, 270.0f, 72.0f)];
            [self.signUpView.signUpButton setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.523+155, 225.0f, 50.0f)];
            [self.signUpView.usernameField setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.504, 225.0f, 50.0f)];
            [self.signUpView.passwordField setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.504+50, 225.0f, 50.0f)];
            [self.signUpView.dismissButton setFrame:CGRectMake(18.0, 32.0, 30.0f, 30.0f)];
            [self.signUpView.emailField setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.504+100, 225.0f, 50.0f)];
            [self.fieldsBackground setFrame:CGRectMake(screenCenterX-225/2, screenCenterY*0.5, 225.0f, 150.0f)];
            [self.logoIcon setFrame:CGRectMake(screenCenterX-42, screenCenterY*0.13, 84.0f, 84.0f)];
        }
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
