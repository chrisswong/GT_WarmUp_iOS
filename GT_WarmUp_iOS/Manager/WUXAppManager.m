//
//  WUXAppManager.m
//  GT_WarmUp_iOS
//
//  Created by Chris on 10/3/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXAppManager.h"

@interface WUXAppManager ()

@property (nonatomic, strong) WUXApiManager *apiManager;
@property (nonatomic, strong) WUXFavouriteManager *favouriteManager;

@end

@implementation WUXAppManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _apiManager = [[WUXApiManager alloc] init];
        
        _favouriteManager = [[WUXFavouriteManager alloc] init];
        
    }
    return self;
}

#pragma mark - Public

+ (WUXAppManager *) sharedManager {
    static dispatch_once_t once;
    static WUXAppManager *_sharedManager;
    dispatch_once(&once, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

- (WUXApiManager *) apiManager {
    return _apiManager;
}

- (WUXFavouriteManager *) favouriteManager {
    return _favouriteManager;
}

@end
