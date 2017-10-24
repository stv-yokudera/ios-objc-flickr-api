//
//  PhotoListViewController.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/17.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "PhotoListViewController.h"
#import "PhotoCell.h"
#import "PhotoListProvider.h"
#import "PhotoSearchAPI.h"
#import "SVProgressHUD.h"

@interface PhotoListViewController () <UISearchBarDelegate, UICollectionViewDelegate, PhotoSearchLoadable>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) PhotoSearchAPI *photoSearchAPI;
@property (nonatomic) PhotoListProvider *provider;
@property (nonatomic) NSString *tags;
@end

@implementation PhotoListViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - Private Methods

- (void)setup {
    self.provider = [[PhotoListProvider alloc] init];
    self.collectionView.dataSource = self.provider;
    self.photoSearchAPI = [[PhotoSearchAPI alloc] init];
    self.photoSearchAPI.loadable = self;
    [self resetPhotoList];
}

- (void)resetSearchBar {
    self.searchBar.text = @"";
}

- (void)resetPhotoList {
    [self.photoSearchAPI reset];
    [self.provider add:@[]];
    [self.collectionView reloadData];
}

- (BOOL)hasMorePhotoList {
    
    if (![self.collectionView isScrollEnd]) {
        return NO;
    }
    if ([self.photoSearchAPI waiting]) {
        return NO;
    }
    return [self.photoSearchAPI isMoreRequest];
}

- (void)scrollToTop {
    
    // リクエストカウントが1の場合は、一番上までスクロールする
    if ([self.photoSearchAPI current] == 1) {
        [self.collectionView scrollToTop];
    }
}

- (void)updatePhotoList:(PhotoSearchResult *)result {
    
    [self.photoSearchAPI updateTotal:result.photos.pages];
    [self.provider append:result.photos.photo];
    [self.collectionView reloadData];
    [self scrollToTop];
}

- (void)resetSearchResultWithMessage:(NSString *)message {
    
    __weak typeof(self)weakSelf = self;
    [self showOkAlert:@"" message:message completionHandler:^(UIAlertAction *action) {
        [weakSelf resetSearchBar];
        [weakSelf resetPhotoList];
    }];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    
    NSString *loadingMessage = [NSString localizedWithKey:@"PHOTOLIST_LOADING"];
    [SVProgressHUD showWithStatus:loadingMessage];
    
    self.tags = searchBar.text;
    [self resetPhotoList];
    [self.photoSearchAPI loadWithTags:self.tags];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [PhotoCell cellSize];
}

#pragma mark - UICollectionViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if ([self hasMorePhotoList]) {
        NSString *loadingMessage = [NSString localizedWithKey:@"PHOTOLIST_LOADING"];
        [SVProgressHUD showWithStatus:loadingMessage];
        [self.photoSearchAPI nextloadWithTags:self.tags];
    }
}

#pragma mark - PhotoSearchLoadable

- (void)loadedThen:(PhotoSearchResult *)response {
    [SVProgressHUD dismiss];
    [self updatePhotoList:response];
}

- (void)emptyThen {
    [SVProgressHUD dismiss];
    NSString *emptyDataMessage = [NSString localizedWithKey:@"PHOTOLIST_NODATA"];
    [self resetSearchResultWithMessage:emptyDataMessage];
}

- (void)offlineThen {
    [SVProgressHUD dismiss];
    NSString *offlineMessage = [NSString localizedWithKey:@"PHOTOLIST_OFFLINE"];
    [self resetSearchResultWithMessage:offlineMessage];
}

- (void)errorThen {
    [SVProgressHUD dismiss];
    NSString *errorMessage = [NSString localizedWithKey:@"PHOTOLIST_ERROR"];
    [self resetSearchResultWithMessage:errorMessage];
}

@end
