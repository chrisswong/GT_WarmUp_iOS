//
//  WUXAlbumCollectionViewCell.m
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXAlbumCollectionViewCell.h"
#import "WUXPhoto.h"

NSString* WUXAlbumCollectionViewCellIdentifier = @"WUXAlbumCollectionViewCellIdentifier";

@implementation WUXAlbumCollectionViewCell

- (IBAction)favButtonDidTap:(UIButton *)sender {
    
    if (self.favButtonDidTapBlock) {
        self.favButtonDidTapBlock(self);
    }
}

- (void) configureCellWithPhoto:(WUXPhoto *) photo {
    
    NSURL *url = [NSURL URLWithString:photo.photoThumbnailUrl];
    [self.imageView sd_setImageWithURL:url];
}

@end
