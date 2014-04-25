//
//  VMG_Guides_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_Guides_ViewController.h"
#import "VMG_LocationDetails_ViewController.h"
#import "TLSpringFlowLayout.h"
#import "VMG_Guides_UICollectionViewCell.h"
#import "VMG_GuideDetails_ViewController.h"
#import "VMG_DiscourseDetail_ViewController.h"

@implementation VMG_Guides_ViewController
{
    NSInteger selectedIndex;
    VMG_GuideDetails_ViewController *vc_guidedetails;
    VMG_LocationDetails_ViewController *vc_locationdetails;
    VMG_DiscourseDetail_ViewController *vc_discoursedetails;
    VMG_Guides_UICollectionViewCell *_sizingCell;
}

static NSString * CellIdentifier = @"cellIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UICollectionView Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndex = indexPath.item;
    
    if (indexPath.item == 4) {
        [self performSegueWithIdentifier:@"locationDetails" sender:self];
    } else if (indexPath.item == 6) {
        [self performSegueWithIdentifier:@"discourseDetails" sender:self];
    } else {
        [self performSegueWithIdentifier:@"guideDetails" sender:self];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VMG_Guides_UICollectionViewCell *guidesCell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.item)
    {
        case 0:
            guidesCell.titleLabel.text = @"Tradition";
            guidesCell.subtitleLabel.text = @"What is Vipassana meditation?";
            break;
            
        case 1:
            guidesCell.titleLabel.text = @"Technique";
            guidesCell.subtitleLabel.text = @"How should I meditate?";
            break;
            
        case 2:
            guidesCell.titleLabel.text = @"Code of Discipline";
            guidesCell.subtitleLabel.text = @"What's expected during the course.";
            break;
            
        case 3:
            guidesCell.titleLabel.text = @"SN Goenka";
            guidesCell.subtitleLabel.text = @"Who is SN Goenka?";
            break;
            
        case 4:
            guidesCell.titleLabel.text = @"Locations";
            guidesCell.subtitleLabel.text = @"Where are Vipassana courses held?";
            break;
            
        case 5:
            guidesCell.titleLabel.text = @"Course Timetable";
            guidesCell.subtitleLabel.text = @"Course daily activities.";
            break;
            
        case 6:
            guidesCell.titleLabel.text = @"Discourse";
            guidesCell.subtitleLabel.text = @"Daily evening discourse (+ audio).";
            break;
            
        case 7:
            guidesCell.titleLabel.text = @"Questions";
            guidesCell.subtitleLabel.text = @"Frequently asked questions.";
            break;
    }

    return guidesCell;
}

#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"locationDetails"]) {
        vc_locationdetails = [segue destinationViewController];
    } else if ([[segue identifier] isEqualToString:@"discourseDetails"]) {
        vc_discoursedetails = [segue destinationViewController];
    } else if ([[segue identifier] isEqualToString:@"guideDetails"]) {
        vc_guidedetails = [segue destinationViewController];
        vc_guidedetails.index = selectedIndex;
    }
}

@end
