//
//  WUXProfileViewController.m
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXProfileViewController.h"
#import "WUXProfile.h"

@interface WUXProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *snsNoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImageView;

@end

@implementation WUXProfileViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.userProfileImageView.layer.cornerRadius = CGRectGetHeight(self.userProfileImageView.frame) / 2;
    self.userProfileImageView.layer.masksToBounds = YES;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    __weak typeof(self)weakSelf = self;
    [API_MANAGER retrieveProfileWithCompletion:^(WUXProfile *profile, NSError *error) {
        
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        if (!strongSelf) {
            return;
        }
        
        if (!error) {
            [strongSelf updateUIWithProfile:profile];
        } else {
            [[UIAlertView alertViewWithError:error] show];
        }
    }];
}

- (void) updateUIWithProfile:(WUXProfile *) profile {
    self.userNameLabel.text = profile.profileUserName;
    self.passwordLabel.text = profile.profilePassword;
    self.emailLabel.text = profile.profileEmail;
    self.phoneNoLabel.text = profile.profilephoneNo;
    self.snsNoLabel.text = profile.profileSnsNo;
}

@end
