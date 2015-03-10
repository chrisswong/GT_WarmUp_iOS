//
//  WUXPhoto.m
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXPhoto.h"
#import <RMMapper/RMMapper.h>

#define kAPIResponseAlbumId @"albumId"
#define kAPIResponsePhotoId @"id"
#define kAPIResponsePhotoTitle @"title"
#define kAPIResponsePhotoUrl @"url"
#define kAPIResponseThumbnailUrl @"thumbnailUrl"

@interface WUXPhoto () <RMMapping>

@end

@implementation WUXPhoto

- (NSDictionary *)rm_dataKeysForClassProperties
{
    // country_code is json key, countryCode is class property
    return @{
             @"photoId" : @"id",
             @"photoTitle" : @"title",
             @"photoUrl" : @"url",
             @"photoThumbnailUrl" : @"thumbnailUrl"
             };
}

@end
