//
//  WUXPhoto.m
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXPhoto.h"

#define kAPIResponseAlbumId @"albumId"
#define kAPIResponsePhotoId @"id"
#define kAPIResponsePhotoTitle @"title"
#define kAPIResponsePhotoUrl @"url"
#define kAPIResponseThumbnailUrl @"thumbnailUrl"

@implementation WUXPhoto

- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    self = [self init];
    if (self) {
        
        self.albumId = dictionary[kAPIResponseAlbumId];
        self.photoId = dictionary[kAPIResponsePhotoId];
        self.photoTitle = dictionary[kAPIResponsePhotoTitle];
        self.photoUrl = dictionary[kAPIResponsePhotoUrl];
        self.photoThumbnailUrl = dictionary[kAPIResponseThumbnailUrl];
        
    }
    return self;
}

@end
