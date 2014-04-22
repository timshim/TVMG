//
//  VMGAppDelegate.h
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "TwitterAdapter.h"

extern CGFloat kCollectionFeedWidthPortrait;
extern CGFloat kCollectionFeedWidthLandscape;

@interface VMGAppDelegate : UIResponder <UIApplicationDelegate>

+ (VMGAppDelegate *)instance;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ACAccountStore *accountStore;
@property (strong, nonatomic) TwitterAdapter *twitterAdapter;
@property (strong, nonatomic) UINavigationController *twitterNavigationController;

@property int duration;

- (void)accessTwitterAccount;

- (void)showError:(NSString*)errorMessage;

@end