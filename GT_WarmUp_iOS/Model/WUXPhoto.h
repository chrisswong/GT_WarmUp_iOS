//
//  WUXPhoto.h
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WUXPhoto : NSObject

@property (nonatomic, copy) NSString *albumId;
@property (nonatomic, copy) NSString *photoId;
@property (nonatomic, copy) NSString *photoTitle;
@property (nonatomic, copy) NSString *photoUrl;
@property (nonatomic, copy) NSString *photoThumbnailUrl;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end
