//
//  VMGAppDelegate.m
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMGAppDelegate.h"

CGFloat kCollectionFeedWidthPortrait = 306;
CGFloat kCollectionFeedWidthLandscape = 306;
BOOL hasDonated1 = NO;
BOOL hasDonated5 = NO;
BOOL hasDonated10 = NO;
BOOL hasDonated20 = NO;
BOOL hasDonated50 = NO;
BOOL hasDonated100 = NO;

@implementation VMGAppDelegate

+ (VMGAppDelegate *)instance
{
    return (VMGAppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"KYG1GOdWE1KLxQpMcYLQy8txipOgo1HYihGMpzaQ"
                  clientKey:@"jN0ZxLcuZruxzXX7yNB5ZJ6aEAHk293IDK5nu46M"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    [PFPurchase addObserverForProduct:@"com.timshim.TVMG.donate1" block:^(SKPaymentTransaction *transaction) {
        hasDonated1 = YES;
    }];
    [PFPurchase addObserverForProduct:@"com.timshim.TVMG.donate5" block:^(SKPaymentTransaction *transaction) {
        hasDonated5 = YES;
    }];
    [PFPurchase addObserverForProduct:@"com.timshim.TVMG.donate10" block:^(SKPaymentTransaction *transaction) {
        hasDonated10 = YES;
    }];
    [PFPurchase addObserverForProduct:@"com.timshim.TVMG.donate20" block:^(SKPaymentTransaction *transaction) {
        hasDonated20 = YES;
    }];
    [PFPurchase addObserverForProduct:@"com.timshim.TVMG.donate50" block:^(SKPaymentTransaction *transaction) {
        hasDonated50 = YES;
    }];
    [PFPurchase addObserverForProduct:@"com.timshim.TVMG.donate100" block:^(SKPaymentTransaction *transaction) {
        hasDonated100 = YES;
    }];
    
    self.accountStore = [[ACAccountStore alloc] init];
    self.twitterAdapter = [[TwitterAdapter alloc] init];
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:220/255.0f green:220/255.0f blue:220/255.0f alpha:1]];
    
    return YES;
}

- (void)accessTwitterAccount
{
    [self.twitterAdapter accessTwitterAccountWithAccountStore:self.accountStore];
}

- (void)showError:(NSString*)errorMessage
{    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:errorMessage
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        [alertView show];
    });
}
							
@end