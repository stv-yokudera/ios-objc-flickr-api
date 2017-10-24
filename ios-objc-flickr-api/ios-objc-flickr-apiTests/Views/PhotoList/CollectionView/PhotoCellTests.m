//
//  PhotoCellTests.m
//  ios-objc-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/24.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import XCTest;
#import "PhotoCell.h"
#import "PhotoListViewController.h"
#import "UICollectionViewCell+Identifier.h"

@interface PhotoListViewController (PhotoCellTestsPrivate)
@property (nonatomic) IBOutlet UICollectionView *collectionView;
@end

@interface PhotoCellTests : XCTestCase <UICollectionViewDataSource>
@property (nonatomic) IBOutlet UICollectionView *fakeCollectionView;
@property (nonatomic) PhotoListViewController *photoListViewController;
@property (nonatomic) PhotoCell *cell;
@end

@implementation PhotoCellTests

- (void)setUp {
    [super setUp];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PhotoListViewController" bundle:nil];
    UINavigationController *navigationController = (UINavigationController *)[storyboard instantiateInitialViewController];
    self.photoListViewController = (PhotoListViewController *)navigationController.topViewController;
    [self.photoListViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
    [self setUpCollectionView];
}

- (void)setUpCollectionView {
    self.fakeCollectionView = self.photoListViewController.collectionView;
    self.fakeCollectionView.dataSource = self;
    
    self.cell = [self.fakeCollectionView dequeueReusableCellWithReuseIdentifier:[PhotoCell identifier]
                                                                   forIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

- (void)testDefaultItem {
    XCTAssertNotNil(self.cell);
    XCTAssertNil(self.cell.imageView.image);
}

- (void)testCellHeight {
    XCTAssertEqual(self.cell.frame.size.height, [PhotoCell cellSize].height);
}

- (void)testCellWidth {
    XCTAssertEqual(self.cell.frame.size.width, [PhotoCell cellSize].width);
}

#pragma mark - FakeDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = [PhotoCell new];
    return cell;
}

@end
