//
//  WUXFavouriteManager.h
//  GT_WarmUp_iOS
//
//  Created by Chris on 10/3/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WUXPhoto;

extern NSString *favouriteListKey;

@interface WUXFavouriteManager : NSObject

- (void) favouritePhoto:(WUXPhoto *) photo;
- (void) unfavouritePhoto:(WUXPhoto *) photo;
- (NSArray *) favouritePhotoList;

@end
