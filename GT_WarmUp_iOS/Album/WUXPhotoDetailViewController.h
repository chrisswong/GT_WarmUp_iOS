//
//  WUXPhotoDetailViewController.h
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WUXPhoto;

@interface WUXPhotoDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (copy, nonatomic) WUXPhoto *photo;

@end
