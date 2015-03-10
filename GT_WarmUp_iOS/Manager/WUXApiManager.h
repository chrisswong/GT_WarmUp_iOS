//
//  WUXApiManager.h
//  GT_WarmUp_iOS
//
//  Created by Chris on 10/3/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WUXProfile;

@interface WUXApiManager : NSObject

- (void) retrieveProfileWithCompletion:(void (^)(WUXProfile *, NSError *))completion;

- (void) retrievePhotosWithCompletion:(void (^)(NSArray *, NSError *)) completion;

@end
