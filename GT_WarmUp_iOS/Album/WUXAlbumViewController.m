//
//  WUXAlbumViewController.m
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXAlbumViewController.h"

@interface WUXAlbumViewController ()

@property (nonatomic, strong) NSArray *photos;

@end

@implementation WUXAlbumViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    __weak typeof(self)weakSelf = self;
    [API_MANAGER retrievePhotosWithCompletion:^(NSArray *photos, NSError *error) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        if (!strongSelf) {
            return ;
        }
        
        if (error) {
            [[UIAlertView alertViewWithError:error] show];
            return;
        }
        
        if (photos) {
            strongSelf.photos = photos;
        }
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Setter
- (void) setPhotos:(NSArray *)photos {
    if (photos) {
        _photos = photos;
        
    }
}
@end
