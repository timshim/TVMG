//
//  VMG_DiscourseDetail_ViewController.h
//  TVMG
//
//  Created by Tim Shim on 24/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VMG_DiscourseDetail_ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *discourseTableView;

@end
