//
//  WUXProfile.m
//  GT_WarmUp_iOS
//
//  Created by Chris on 10/3/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXProfile.h"

@implementation WUXProfile

- (id) initWithDictionary:(NSDictionary *) dictionary {
    self = [self init];
    if (self) {
        
        self.profileUserName = [NSString stringWithFormat:@"%@ %@", dictionary[@"name"][@"first"] ,dictionary[@"name"][@"last"]];
        self.profilePassword = dictionary[@"password"];
        self.profilePicUrlString = dictionary[@"picture"][@"thumbnail"];
        self.profileEmail = dictionary[@"email"];
        self.profilephoneNo = dictionary[@"phone"];
        self.profileSnsNo = dictionary[@"NINO"];
    }
    return self;
}

@end
