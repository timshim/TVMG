//
//  VMG_Profile_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_Profile_ViewController.h"
#import "VMG_Login_ViewController.h"
#import "VMG_Signup_ViewController.h"
#import "FTWCache.h"
#import "PXAlertView.h"
#import <QuartzCore/QuartzCore.h>

@interface VMG_Profile_ViewController ()

@end

@implementation VMG_Profile_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([PFUser currentUser]) {
        [self getProfilePhoto];
    } else {
        [FTWCache resetCache];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    if (![PFUser currentUser]) {
        
        [FTWCache resetCache];

        VMG_Login_ViewController *logInViewController = [[VMG_Login_ViewController alloc] init];
        [logInViewController setDelegate:self];
        [logInViewController setFields:PFLogInFieldsUsernameAndPassword
         | PFLogInFieldsLogInButton
         | PFLogInFieldsSignUpButton];

        VMG_Signup_ViewController *signUpViewController = [[VMG_Signup_ViewController alloc] init];
        [signUpViewController setDelegate:self];
        [signUpViewController setFields:PFSignUpFieldsEmail
         | PFSignUpFieldsUsernameAndPassword
         | PFSignUpFieldsDismissButton
         | PFSignUpFieldsSignUpButton];
        
        [logInViewController setSignUpController:signUpViewController];
        
        [self presentViewController:logInViewController animated:YES completion:NULL];
    } else {
        [self getProfilePhoto];
    }
    
    PFUser *currentUser = [PFUser currentUser];
    _usernameLabel.text = currentUser.username;
    _emailLabel.text = currentUser.email;
    
    [self.tabBarController.tabBar setBarStyle:UIBarStyleBlack];
}

- (void)logInViewController:(VMG_Login_ViewController *)logInController didLogInUser:(PFUser *)user
{
    [self getProfilePhoto];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)showImagePicker
{
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)) {
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    UIGraphicsBeginImageContext(CGSizeMake(480.0f, 480.0f));
    [image drawInRect: CGRectMake(0, 0, 480, 480)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(smallImage, 1.0);
    [self uploadImage:imageData];
}

- (void)uploadImage:(NSData *)imageData
{
    PFUser *user = [PFUser currentUser];
    PFFile *imageFile = [PFFile fileWithName:@"profileImage@2x.jpg" data:imageData];
    PFQuery *query = [PFUser query];
    NSString *userId = user.objectId;
    
    [query getObjectInBackgroundWithId:userId block:^(PFObject *userObject, NSError *error) {
        if (!error) {
            [FTWCache resetCache];
            [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                userObject[@"profileImage"] = imageFile;
                [userObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    [self getProfilePhoto];
                }];
            } progressBlock:^(int percentDone) {
                
            }];
        }
    }];
}

- (IBAction)refresh:(id)sender
{
    refreshHUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:refreshHUD];
    
    refreshHUD.delegate = self;
    
    [refreshHUD show:YES];
    
    NSLog(@"refresh success!");
}

- (IBAction)profilePhotoPressed:(UIButton *)sender
{
    [self showImagePicker];
}

- (void)getProfilePhoto
{
    [self refresh:nil];
    
    PFUser *user = [PFUser currentUser];
    PFQuery *query = [PFUser query];
    NSString *userId = user.objectId;
    NSData *data = [FTWCache objectForKey:@"profileImageCache"];
    
    if (data) {
        UIImage *image = [UIImage imageWithData:data];
        [self.profilePhotoButton setImage:image forState:UIControlStateNormal];
    } else {
        [query getObjectInBackgroundWithId:userId block:^(PFObject *userObject, NSError *error) {
            if (!error) {
                PFFile *imageFile = [userObject objectForKey:@"profileImage"];
                [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    if (!error) {
                        UIImage *image = [UIImage imageWithData:data];
                        [FTWCache setObject:data forKey:@"profileImageCache"];
                        [self.profilePhotoButton setImage:image forState:UIControlStateNormal];
                        [refreshHUD hide:YES];
                    }
                }];
            }
        }];
    }
    
    CALayer *imageLayer = self.profilePhotoButton.layer;
    [imageLayer setCornerRadius:60];
    [imageLayer setBorderWidth:0];
    [imageLayer setMasksToBounds:YES];
    
    [refreshHUD hide:YES];
}

- (void)hudWasHidden:(MBProgressHUD *)hud
{
    [HUD removeFromSuperview];
    HUD = nil;
}

- (IBAction)logoutPressed:(id)sender
{
    [PXAlertView showAlertWithTitle:@"Log out"
                            message:@"You won't be able to use the app while logged out. Are you sure?"
                        cancelTitle:@"Cancel"
                         otherTitle:@"Yes"
                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                             if (buttonIndex == 1) {
                                 [FTWCache resetCache];
                                 [PFUser logOut];
                                 
                                 VMG_Login_ViewController *logInViewController = [[VMG_Login_ViewController alloc] init];
                                 [logInViewController setDelegate:self];
                                 [logInViewController setFields:PFLogInFieldsUsernameAndPassword
                                  | PFLogInFieldsLogInButton
                                  | PFLogInFieldsSignUpButton];
                                 
                                 VMG_Signup_ViewController *signUpViewController = [[VMG_Signup_ViewController alloc] init];
                                 [signUpViewController setDelegate:self];
                                 [signUpViewController setFields:PFSignUpFieldsEmail
                                  | PFSignUpFieldsUsernameAndPassword
                                  | PFSignUpFieldsDismissButton
                                  | PFSignUpFieldsSignUpButton];
                                 
                                 [logInViewController setSignUpController:signUpViewController];
                                 
                                 [self presentViewController:logInViewController animated:YES completion:NULL];
                             }
                         }];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
