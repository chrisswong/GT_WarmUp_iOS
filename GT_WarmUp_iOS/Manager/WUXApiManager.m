//
//  WUXApiManager.m
//  GT_WarmUp_iOS
//
//  Created by Chris on 10/3/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXApiManager.h"
#import <AFNetworking/AFNetworking.h>

#import "WUXProfile.h"
#import <RMMapper/RMMapper.h>

@implementation WUXApiManager

- (void) retrieveProfileWithCompletion:(void (^)(WUXProfile *, NSError *))completion {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[WUXApiManager profileUrlString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (responseObject) {
            NSDictionary *profileDict = responseObject[@"results"][0][@"user"];
            WUXProfile *profile = [[WUXProfile alloc] initWithDictionary:profileDict];
            completion(profile, nil);
            
        } else {
            completion(nil, nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        completion(nil, error);
    }];
}

+ (NSString *) profileUrlString {
    return @"http://api.randomuser.me/";
}

- (void) retrievePhotosWithCompletion:(void (^)(NSArray *, NSError *)) completion {
    
}

@end
