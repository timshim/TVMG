//
//  VMG_Stories_ViewController.h
//  TVMG
//
//  Created by Tim Shim on 2/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VMG_Stories_ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
