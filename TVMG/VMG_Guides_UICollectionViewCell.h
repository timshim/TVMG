//
//  VMG_Guides_UICollectionViewCell.h
//  TVMG
//
//  Created by Tim Shim on 17/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VMG_Guides_UICollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end