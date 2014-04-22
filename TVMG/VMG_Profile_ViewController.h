//
//  VMG_Profile_ViewController.h
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MBProgressHUD.h"

@interface VMG_Profile_ViewController : UIViewController <UINavigationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UIImagePickerControllerDelegate, MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
    MBProgressHUD *refreshHUD;
}

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UIButton *logoutPressed;
@property (weak, nonatomic) IBOutlet UIButton *editPressed;
@property (weak, nonatomic) IBOutlet UIButton *profilePhotoButton;

- (IBAction)refresh:(id)sender;
- (void)uploadImage:(NSData *)imageData;

@end