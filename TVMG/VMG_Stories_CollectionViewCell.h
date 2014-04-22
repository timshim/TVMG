//
//  VMG_Stories_CollectionViewCell.h
//  TVMG
//
//  Created by Tim Shim on 19/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VMG_Stories_CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetText;

@end