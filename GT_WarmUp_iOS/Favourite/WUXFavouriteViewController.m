//
//  WUXFavouriteViewController.m
//  GT_WarmUp_iOS
//
//  Created by chris on 23/2/15.
//  Copyright (c) 2015 Green Tomato. All rights reserved.
//

#import "WUXFavouriteViewController.h"
#import "WUXPhoto.h"
#import "WUXPhotoDetailViewController.h"

@interface WUXFavouriteViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *favPhotoList;
@end

@implementation WUXFavouriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.favPhotoList = [FAV_MANAGER favouritePhotoList];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setter
- (void) setFavPhotoList:(NSArray *)favPhotoList {
    if ([favPhotoList count] > 0) {
        _favPhotoList = favPhotoList;
        [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.favPhotoList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"favouriteCellIdentifier"];
    WUXPhoto *photo = self.favPhotoList[indexPath.row];
    cell.textLabel.text = photo.photoTitle;
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"FAV_PHOTO_DETAIL"]) {
        
        if ([segue.destinationViewController isKindOfClass:[WUXPhotoDetailViewController class]]) {
            
            WUXPhotoDetailViewController *detailViewController = (WUXPhotoDetailViewController *) segue.destinationViewController;
            
            if ([sender isKindOfClass:[UITableViewCell class]]) {
                NSIndexPath *cellIndexPath = [self.tableView indexPathForSelectedRow];
                if (cellIndexPath) {
                    detailViewController.photo = self.favPhotoList[cellIndexPath.row];
                }
            }

        }
    }
}

@end
