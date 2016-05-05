//
//  AXCViewController.m
//  AXCGiphy
//
//  Created by Alex Choi on 08/19/2014.
//  Copyright (c) 2014 Alex Choi. All rights reserved.
//

#import "AXCViewController.h"
#import <Giphy-iOS/AXCGiphy.h>
#import "AXCCollectionViewCell.h"
#import <AnimatedGIFImageSerialization/AnimatedGIFImageSerialization.h>

NSString * const kCollectionViewCellIdentifier = @"cellReuseIdentifier";
@interface AXCViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSArray * giphyResults;
@property (weak, nonatomic) IBOutlet UICollectionView * collectionView;

@property (nonatomic, strong) NSMutableArray *gifArrayKeyword1;
@property (nonatomic, strong) NSArray *gifArrayKeyword2;
@property (nonatomic, strong) NSArray *gifArrayKeyword3;
@property (nonatomic, strong) NSArray *gifArrayKeyword4;
@property (nonatomic, strong) NSArray *gifArrayKeyword5;

@property (nonatomic) NSMutableArray *keywordArray;

// Sharing array
@property (nonatomic, strong) NSMutableArray *selectedItemsArray;
@end

@implementation AXCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // set your API key before making any requests. You may use kGiphyPublicAPIKey for development.
    [AXCGiphy setGiphyAPIKey:kGiphyPublicAPIKey];
   
    // see the methods below for usage examples
//    [self searchForFrogs];
    self.selectedItemsArray = [[NSMutableArray alloc] init];
    self.keywordArray = [NSMutableArray arrayWithObjects:self.keyword1, self.keyword2, self.keyword3, self.keyword4, self.keyword5, nil];
    self.gifArrayKeyword1 = [[NSMutableArray alloc] init];
   [self searchForKeyword:nil];
}


-(void)searchForKeyword:(NSString *)keyword
{
//     NSLog(@"searchForKeyword: %ld", (unsigned long)self.keywordArray.count);
    
    for (NSString *word in self.keywordArray) {
        
        if (word) {
            
            __unused NSURLSessionDataTask * task = [AXCGiphy searchGiphyWithTerm:word limit:5 offset:0 completion:^(NSArray *results, NSError *error) {
                
//                NSLog(@"Result: %ld", results.count);
                
                [self.gifArrayKeyword1 addObjectsFromArray:results];
//                self.gifArrayKeyword1 = results;

//                self.giphyResults = results;
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.collectionView reloadData];
                }];
            }];
            
            [task resume];
        }
    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    AXCCollectionViewCell *cell = (AXCCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    if(!cell.isSelected){
        [self.selectedItemsArray addObject:cell.gifUrl];
        cell.isSelected = YES;
        cell.selectedLabel.hidden = NO;
    }else {
        [self.selectedItemsArray removeObject:cell.gifUrl];
        cell.isSelected = NO;
        cell.selectedLabel.hidden = YES;
    }
}
- (IBAction)SendToMomButtonTapped:(id)sender {
    // grab an item we want to share
    NSMutableArray *itemsToPost = [NSMutableArray new];
    //NSString *message = @"Here are are some of your favorite things";
    //[itemsToPost addObject:message];
    for (NSURL *url in self.selectedItemsArray) {
        NSData *gifData = [NSData dataWithContentsOfURL:url];
        
        [itemsToPost addObject:gifData];
        
    }
    
    // build an activity view controller
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToPost applicationActivities:nil];
    
    // exclude several items
    NSArray *excluded = @[UIActivityTypePostToFacebook, UIActivityTypePostToTwitter, UIActivityTypeAirDrop, UIActivityTypePostToTencentWeibo, UIActivityTypePostToVimeo, UIActivityTypeAddToReadingList, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeSaveToCameraRoll ];
    activityVC.excludedActivityTypes = excluded;
    
    // and present it
    [self presentViewController:activityVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UICollectionViewDataSource
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.gifArrayKeyword1.count;
}
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AXCCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier forIndexPath:indexPath];
    AXCGiphy * gif = self.gifArrayKeyword1[indexPath.item];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:gif.originalImage.url];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        UIImage * image = [UIImage imageWithData:data];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            cell.imageView.image = image;
            cell.gifUrl = gif.originalImage.url;
        }];
    }] resume];
    
    return cell;
}
@end
