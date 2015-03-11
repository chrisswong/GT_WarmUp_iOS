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

- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    self = [self init];
    if (self) {
        
    }
    return self;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:@(self.photoId) forKey:@"photoId"];
    [aCoder encodeObject:@(self.albumId) forKey:@"albumId"];
    [aCoder encodeObject:self.photoTitle forKey:@"photoTitle"];
    [aCoder encodeObject:self.photoUrl forKey:@"photoUrl"];
    [aCoder encodeObject:self.photoThumbnailUrl forKey:@"photoThumbnailUrl"];
    [aCoder encodeObject:@(YES) forKey:@"isFavourite"];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (self) {
        self.photoId = [[aDecoder decodeObjectForKey:@"photoId"] integerValue];
        self.albumId = [[aDecoder decodeObjectForKey:@"albumId"] integerValue];
        self.photoTitle = [aDecoder decodeObjectForKey:@"photoTitle"];
        self.photoUrl = [aDecoder decodeObjectForKey:@"photoUrl"];
        self.photoThumbnailUrl = [aDecoder decodeObjectForKey:@"photoThumbnailUrl"];
        self.isFavourite = [[aDecoder decodeObjectForKey:@"isFavourite"] boolValue];
    }
    return self;
}


@end
