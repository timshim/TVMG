//
//  VMG_DiscourseDetail_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 24/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_DiscourseDetail_ViewController.h"
#import "VMG_DiscourseText_ViewController.h"

@interface VMG_DiscourseDetail_ViewController ()
{
    NSArray *dayTitles;
    NSArray *daySubtitles;
    VMG_DiscourseText_ViewController *vc_discourseText;
}
@end

@implementation VMG_DiscourseDetail_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];

    [self.discourseTableView setSeparatorInset:UIEdgeInsetsZero];
    self.discourseTableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
    self.discourseTableView.rowHeight = 90;
    
    dayTitles = [NSArray arrayWithObjects:@"Foreword", @"Day 1", @"Day 2", @"Day 3", @"Day 4", @"Day 5", @"Day 6", @"Day 7", @"Day 8", @"Day 9", @"Day 10", @"Day 11", nil];
    daySubtitles = [NSArray arrayWithObjects:@"Notes on the text", @"The purpose of this meditation", @"Universal definition of sin and piety", @"The Noble Eightfold Path", @"The four aggregates of the mind", @"The Four Noble Truths", @"Awareness and equanimity", @"The Five 'Friends'", @"The Law of Multiplication", @"Applying the technique in daily life", @"Review of the technique", @"How to continue practicing", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dayTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    }
    
    UILabel *dayLabel = (UILabel *)[cell.contentView viewWithTag:10];
    [dayLabel setText:[dayTitles objectAtIndex:indexPath.row]];
    UILabel *daySubLabel = (UILabel *)[cell.contentView viewWithTag:11];
    [daySubLabel setText:[daySubtitles objectAtIndex:indexPath.row]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    vc_discourseText.discourseSelected = indexPath.row;
}

- (CGFloat)heightForRowAtIndex:(NSUInteger)index
{
    return 60;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"discourseText"]) {
        vc_discourseText = [segue destinationViewController];
    }
}

@end
