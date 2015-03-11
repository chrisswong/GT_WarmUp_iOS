//
//  WUXFavouriteManager.m
//  GT_WarmUp_iOS
//
//  Created by Chris on 10/3/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXFavouriteManager.h"
#import "WUXPhoto.h"
NSString *favouriteListKey = @"com.gtomato.enterprise.ios.warmup.favouriteListKey";
@interface WUXFavouriteManager ()

@property (nonatomic, weak) NSUserDefaults *standardUserDefaults;

@end

@implementation WUXFavouriteManager

- (NSUserDefaults *) standardUserDefaults {
    return [NSUserDefaults standardUserDefaults];
}

- (void) favouritePhoto:(WUXPhoto *) photo {
    
    if (!photo) {
        return;
    }
    
    NSData *favouriteListData = [self.standardUserDefaults objectForKey:favouriteListKey];
    NSMutableArray *tempList = nil;
    NSArray *favouriteList = nil;
    if (!favouriteListData) {
        tempList = [NSMutableArray array];
    } else {
        favouriteList = [NSKeyedUnarchiver unarchiveObjectWithData:favouriteListData];
        tempList = [NSMutableArray arrayWithArray:favouriteList];
    }
    [tempList addObject:photo];
    favouriteList = [NSArray arrayWithArray:tempList];
    [self commitFavouriteList:favouriteList];
}
- (void) unfavouritePhoto:(WUXPhoto *) photo {
    
    if (!photo) {
        return;
    }
    
    NSData *favouriteListData = [self.standardUserDefaults objectForKey:favouriteListKey];
    
    if (!favouriteListData) {
        return;
    } else {
        NSArray *favouriteList = [NSKeyedUnarchiver unarchiveObjectWithData:favouriteListData];

        if ([favouriteList count] == 0) {
            return;
        }
        
        NSMutableArray *tempList = [NSMutableArray arrayWithArray:favouriteList];
        
        for (NSInteger i = 0 ; i< [favouriteList count] ; i++) {
            WUXPhoto *aPhoto = favouriteList[i];
            if (aPhoto.photoId == photo.photoId) {
                [tempList removeObject:aPhoto];
                favouriteList = [NSArray arrayWithArray:tempList];
                [self commitFavouriteList:favouriteList];
                break;
            }
        }
    }
}

- (void) commitFavouriteList:(NSArray *) list {
    
    [self.standardUserDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:list] forKey:favouriteListKey];
    [self.standardUserDefaults synchronize];
}

- (NSArray *) favouritePhotoList {
    NSData *favouriteListData = [self.standardUserDefaults objectForKey:favouriteListKey];
    if (favouriteListData) {
        return [NSKeyedUnarchiver unarchiveObjectWithData:favouriteListData];
    } else {
        return @[];
    }
}
@end
