//
//  WUXAppManager.h
//  GT_WarmUp_iOS
//
//  Created by Chris on 10/3/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WUXApiManager.h"
#import "WUXFavouriteManager.h"

#define API_MANAGER [[WUXAppManager sharedManager] apiManager]
#define FAV_MANAGER [[WUXAppManager sharedManager] favouriteManager]

@interface WUXAppManager : NSObject

+ (WUXAppManager *) sharedManager;

- (WUXApiManager *) apiManager;

- (WUXFavouriteManager *) favouriteManager;

@end
