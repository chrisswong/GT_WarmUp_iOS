//
//  WUXAlbumCollectionViewCell.h
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WUXPhoto;

extern NSString* WUXAlbumCollectionViewCellIdentifier;

@interface WUXAlbumCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (copy, nonatomic) void (^favButtonDidTapBlock)(WUXAlbumCollectionViewCell *cell);

- (void) configureCellWithPhoto:(WUXPhoto *) photo;


@end
