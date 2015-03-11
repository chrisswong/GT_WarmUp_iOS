//
//  WUXPhoto.h
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WUXPhoto : NSObject <NSCoding, NSCopying>

@property (nonatomic) NSInteger albumId;
@property (nonatomic) NSInteger photoId;
@property (nonatomic, strong) NSString *photoTitle;
@property (nonatomic, strong) NSString *photoUrl;
@property (nonatomic, strong) NSString *photoThumbnailUrl;
@property (nonatomic) BOOL isFavourite;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end
