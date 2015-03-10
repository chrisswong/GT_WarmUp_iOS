//
//  WUXProfile.h
//  GT_WarmUp_iOS
//
//  Created by Chris on 10/3/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WUXProfile : NSObject

@property (nonatomic, copy) NSString *profilePicUrlString;
@property (nonatomic, copy) NSString *profileUserName;
@property (nonatomic, copy) NSString *profilePassword;
@property (nonatomic, copy) NSString *profileEmail;
@property (nonatomic, copy) NSString *profilephoneNo;
@property (nonatomic, copy) NSString *profileSnsNo;

- (id) initWithDictionary:(NSDictionary *) dictionary;

@end
