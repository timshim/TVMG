//
//  VMG_DonateDetails_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 22/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_DonateDetails_ViewController.h"
#import "PXAlertView.h"
#import "VMGAppDelegate.h"

@interface VMG_DonateDetails_ViewController ()

@end

@implementation VMG_DonateDetails_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)donatePressed1:(UIButton *)sender
{
    [PXAlertView showAlertWithTitle:@"Donate"
                            message:@"You chose to donate $1. Confirm donation?"
                        cancelTitle:@"Cancel"
                         otherTitle:@"Yes"
                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                             if (buttonIndex == 1) {
                                 [PFPurchase buyProduct:@"com.timshim.TVMG.donate1" block:^(NSError *error) {
                                     if (!error) {
                                         [PXAlertView showAlertWithTitle:@"Thank You!" message:@"$1 donated"];
                                     } else {
                                         NSLog(@"%@", error);
                                     }
                                 }];
                             }
                         }];
}

- (IBAction)donatePressed5:(UIButton *)sender
{
    [PXAlertView showAlertWithTitle:@"Donate"
                            message:@"You chose to donate $5. Confirm donation?"
                        cancelTitle:@"Cancel"
                         otherTitle:@"Yes"
                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                             if (buttonIndex == 1) {
                                 [PFPurchase buyProduct:@"com.timshim.TVMG.donate5" block:^(NSError *error) {
                                     if (!error) {
                                         [PXAlertView showAlertWithTitle:@"Thank You!" message:@"$5 donated"];
                                     }
                                 }];
                             }
                         }];
}

- (IBAction)donatePressed10:(UIButton *)sender
{
    [PXAlertView showAlertWithTitle:@"Donate"
                            message:@"You chose to donate $10. Confirm donation?"
                        cancelTitle:@"Cancel"
                         otherTitle:@"Yes"
                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                             if (buttonIndex == 1) {
                                 [PFPurchase buyProduct:@"com.timshim.TVMG.donate10" block:^(NSError *error) {
                                     if (!error) {
                                         [PXAlertView showAlertWithTitle:@"Thank You!" message:@"$10 donated"];
                                     }
                                 }];
                             }
                         }];
}

- (IBAction)donatePressed20:(UIButton *)sender
{
    [PXAlertView showAlertWithTitle:@"Donate"
                            message:@"You chose to donate $20. Confirm donation?"
                        cancelTitle:@"Cancel"
                         otherTitle:@"Yes"
                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                             if (buttonIndex == 1) {
                                 [PFPurchase buyProduct:@"com.timshim.TVMG.donate20" block:^(NSError *error) {
                                     if (!error) {
                                         [PXAlertView showAlertWithTitle:@"Thank You!" message:@"$20 donated"];
                                     }
                                 }];
                             }
                         }];
}

- (IBAction)donatePressed50:(UIButton *)sender
{
    [PXAlertView showAlertWithTitle:@"Donate"
                            message:@"You chose to donate $50. Confirm donation?"
                        cancelTitle:@"Cancel"
                         otherTitle:@"Yes"
                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                             if (buttonIndex == 1) {
                                 [PFPurchase buyProduct:@"com.timshim.TVMG.donate50" block:^(NSError *error) {
                                     if (!error) {
                                         [PXAlertView showAlertWithTitle:@"Thank You!" message:@"$50 donated"];
                                     }
                                 }];
                             }
                         }];
}

- (IBAction)donatePressed100:(UIButton *)sender
{
    [PXAlertView showAlertWithTitle:@"Donate"
                            message:@"You chose to donate $100. Confirm donation?"
                        cancelTitle:@"Cancel"
                         otherTitle:@"Yes"
                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                             if (buttonIndex == 1) {
                                 [PFPurchase buyProduct:@"com.timshim.TVMG.donate100" block:^(NSError *error) {
                                     if (!error) {
                                         [PXAlertView showAlertWithTitle:@"Thank You!" message:@"$100 donated"];
                                     }
                                 }];
                             }
                         }];
}

@end