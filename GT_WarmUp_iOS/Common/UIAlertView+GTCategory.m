//
//  UIAlertView+GTCategory.m
//  GT_WarmUp_iOS
//
//  Created by Chris on 10/3/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "UIAlertView+GTCategory.h"

@implementation UIAlertView (GTCategory)

+ (UIAlertView *) alertViewWithError:(NSError *) error {
    return [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
}

@end
