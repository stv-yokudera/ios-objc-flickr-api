//
//  PhotoListViewControllerTests.m
//  ios-objc-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/25.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import XCTest;
#import "PhotoListViewController.h"
#import "PhotoListProvider.h"
#import "PhotoSearchAPI.h"

@interface PhotoListViewController (PhotoCellTestsPrivate)
@property (nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) PhotoSearchAPI *photoSearchAPI;
@property (nonatomic) PhotoListProvider *provider;
@end

@interface PhotoListViewControllerTests : XCTestCase
@property (nonatomic) PhotoListViewController *photoListViewController;
@end

@implementation PhotoListViewControllerTests

- (void)setUp {
    [super setUp];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PhotoListViewController" bundle:nil];
    UINavigationController *navigationController = (UINavigationController *)[storyboard instantiateInitialViewController];
    self.photoListViewController = (PhotoListViewController *)navigationController.topViewController;
    [self.photoListViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
    [self.photoListViewController viewDidLoad];
}

/**
 CollectionViewのデータソースが設定されているかテスト
 */
- (void)testCollectionViewDataSource {
    XCTAssertNotNil(self.photoListViewController.collectionView.dataSource);
    
    XCTAssertEqualObjects(self.photoListViewController.collectionView.dataSource,
                          self.photoListViewController.provider);
}

/**
 CollectionViewのデリゲートが設定されているかテスト
 */
- (void)testCollectionViewDelegate {
    XCTAssertNotNil(self.photoListViewController.collectionView.delegate);
    
    XCTAssertEqualObjects(self.photoListViewController.collectionView.delegate,
                          self.photoListViewController);
}

/**
 PhotoSearchAPIのデリゲートが設定されているかテスト
 */
- (void)testPhotoSearchAPILoadable {
    XCTAssertNotNil(self.photoListViewController.photoSearchAPI.loadable);
    
    XCTAssertEqualObjects(self.photoListViewController.photoSearchAPI.loadable,
                          self.photoListViewController);
}

/**
 ナビゲーションバータイトルのテスト
 */
- (void)testNavigationTitle {
    XCTAssertEqualObjects(self.photoListViewController.navigationItem.title, @"写真検索");
}

@end
