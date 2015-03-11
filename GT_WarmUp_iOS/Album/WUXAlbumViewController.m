//
//  WUXAlbumViewController.m
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXAlbumViewController.h"
#import "WUXAlbumCollectionViewCell.h"
#import "WUXPhoto.h"

@interface WUXAlbumViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *photos;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

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
            [strongSelf updateFavouritePhotos];
            
        }
    }];
    
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.photos count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WUXAlbumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:WUXAlbumCollectionViewCellIdentifier forIndexPath:indexPath];
    WUXPhoto *photo = self.photos[indexPath.row];
    [cell configureCellWithPhoto:photo];
    
    __weak typeof(self)weakSelf = self;
    [cell setFavButtonDidTapBlock:^(WUXAlbumCollectionViewCell *cell) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf markFavouriteWithCell:cell];
    }];
    return cell;
}

#pragma mark - UICollectionDelegate

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Private

- (void) markFavouriteWithCell:(WUXAlbumCollectionViewCell *)cell {
    if (cell) {
        NSIndexPath *cellIndexPath = [self.collectionView indexPathForCell:cell];
        if (cellIndexPath) {
            WUXPhoto *photo = self.photos[cellIndexPath.row];
            
            if (photo.isFavourite) {
                [FAV_MANAGER unfavouritePhoto:photo];
                cell.favButton.selected = NO;
                photo.isFavourite = NO;
            } else {
                [FAV_MANAGER favouritePhoto:photo];
                cell.favButton.selected = YES;
                photo.isFavourite = YES;
            }

        }
    }
}

- (void) updateFavouritePhotos {
    NSArray *list = [FAV_MANAGER favouritePhotoList];
    for (WUXPhoto *favPhoto in list) {
        for (WUXPhoto *apiPhoto in self.photos) {
            if (favPhoto.photoId == apiPhoto.photoId) {
                apiPhoto.isFavourite = YES;
            }
        }
    }
}

#pragma mark - Setter
- (void) setPhotos:(NSArray *)photos {
    if (photos) {
        _photos = photos;
        [self.collectionView reloadData];
    }
}
@end
