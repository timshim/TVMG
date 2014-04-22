//
//  VMG_GuideDetails_ViewController.h
//  TVMG
//
//  Created by Tim Shim on 17/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FTCoreTextView;

@interface VMG_GuideDetails_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *guideDetailsTitle;
@property (strong, nonatomic) IBOutlet UIView *contentTextView;
@property (strong, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (strong, nonatomic) FTCoreTextView *coreTextView;
@property NSInteger index;

@end