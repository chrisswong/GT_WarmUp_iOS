//
//  WUXPhotoDetailViewController.m
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXPhotoDetailViewController.h"
#import "WUXPhoto.h"
@interface WUXPhotoDetailViewController () <UIScrollViewDelegate>

@end

@implementation WUXPhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.photo) {
        [self updateUI];
    }
}

- (void) setPhoto:(WUXPhoto *)photo {
    _photo = [photo copy];
    [self updateUI];
}

#pragma mark - Private
- (void) updateUI {
    NSURL *url = [NSURL URLWithString:self.photo.photoUrl];
    if (url) {
        [self.imageView sd_setImageWithURL:url];
    }
}

#pragma mark - UIScrollViewDelegate

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
