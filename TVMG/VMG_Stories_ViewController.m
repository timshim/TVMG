//
//  VMG_Stories_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_Stories_ViewController.h"
#import "TLSpringFlowLayout.h"
#import "VMG_Stories_CollectionViewCell.h"
#import "TwitterAdapter.h"
#import "VMGAppDelegate.h"
#import "ISRefreshControl.h"
#import "Utils.h"

@interface VMG_Stories_ViewController ()

@property (strong, atomic) NSArray *tweets;
@property (nonatomic, strong) ISRefreshControl *refreshControl;
@property (nonatomic, strong) NSDate *startRefreshDate;

@end

@implementation VMG_Stories_ViewController

static NSString * CellIdentifier = @"tweetCellIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
    self.refreshControl = [[ISRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.5];
    [self.collectionView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self
                            action:@selector(loadTwitterData)
                  forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadTwitterData) name:AccountTwitterAccessGranted object:nil];
    
    TwitterAdapter* twitterAdapter = [VMGAppDelegate instance].twitterAdapter;
    [twitterAdapter accessTwitterAccountWithAccountStore:[VMGAppDelegate instance].accountStore];
}

- (void)loadTwitterData
{
    self.startRefreshDate = [NSDate date];
    [self refreshTwitterFeed];
}

- (void)refreshTwitterFeed
{
    TwitterAdapter* twitterAdapter = [VMGAppDelegate instance].twitterAdapter;
    
    [twitterAdapter refreshTwitterFeedWithCompletion:^(NSArray* jsonResponse) {
        [self twitterFeedRefreshed:jsonResponse];
    }];
}

- (void)twitterFeedRefreshed:(NSArray*)jsonResponse
{
    self.tweets = jsonResponse;
    [self.collectionView reloadData];
    
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:_startRefreshDate];
    NSTimeInterval minimumInterval = 3;
    if (interval > minimumInterval) {
        [self.refreshControl endRefreshing];
    } else {
        [self.refreshControl performSelector:@selector(endRefreshing) withObject:nil afterDelay:(minimumInterval-interval)];
    }
}

#pragma mark - UICollectionView Methods

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VMG_Stories_CollectionViewCell *cell = (VMG_Stories_CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"tweetCellIdentifier" forIndexPath:indexPath];
    
    NSDictionary *tweetDictionary = self.tweets[indexPath.row];
    
    cell.tweetText.text = tweetDictionary[@"text"];
    cell.tweetText.font = [UIFont fontWithName:@"GillSans-Light" size:20.0f];
    cell.tweetText.textColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.8];
    
    NSArray *days = [NSArray arrayWithObjects:@"Mon ", @"Tue ", @"Wed ", @"Thu ", @"Fri ", @"Sat ", @"Sun ", nil];
    NSArray *calendarMonths = [NSArray arrayWithObjects:@"Jan", @"Feb", @"Mar",@"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec", nil];
    NSString *dateStr = [tweetDictionary objectForKey:@"created_at"];
    
    for (NSString *day in days) {
        if ([dateStr rangeOfString:day].location == 0) {
            dateStr = [dateStr stringByReplacingOccurrencesOfString:day withString:@""];
            break;
        }
    }
    
    NSArray *dateArray = [dateStr componentsSeparatedByString:@" "];
    NSArray *hourArray = [[dateArray objectAtIndex:2] componentsSeparatedByString:@":"];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    NSString *aux = [dateArray objectAtIndex:0];
    int month = 0;
    for (NSString *m in calendarMonths) {
        month++;
        if ([m isEqualToString:aux]) {
            break;
        }
    }
    components.month = month;
    components.day = [[dateArray objectAtIndex:1] intValue];
    components.hour = [[hourArray objectAtIndex:0] intValue];
    components.minute = [[hourArray objectAtIndex:1] intValue];
    components.second = [[hourArray objectAtIndex:2] intValue];
    components.year = [[dateArray objectAtIndex:4] intValue];
    
    NSTimeZone *gmt = [NSTimeZone timeZoneForSecondsFromGMT:2];
    [components setTimeZone:gmt];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *date = [calendar dateFromComponents:components];
    
    cell.dateLabel.text = [Utils getTimeAsString:date];
    
    return cell;
}

#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tweets.count;
}

#pragma mark - UICollectionView delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = kCollectionFeedWidthPortrait;
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
        width = kCollectionFeedWidthLandscape;
    }
    return CGSizeMake(width, [self heightForCellAtIndex:indexPath.row]);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(TLSpringFlowLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self heightForCellAtIndex:indexPath.row];
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
        return UIEdgeInsetsMake(0, 0, 60, 0);
    }
    else{
        return UIEdgeInsetsMake(0, 0, 60, 0);
    }
}

- (CGFloat)heightForCellAtIndex:(NSUInteger)index
{
    return 170;
}

@end
