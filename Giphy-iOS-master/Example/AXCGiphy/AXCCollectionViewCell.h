//
//  AXCCollectionViewCell.h
//  AXCGiphy
//
//  Created by alexchoi on 8/19/14.
//  Copyright (c) 2014 Alex Choi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AXCCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView * imageView;
@property (nonatomic, strong) NSURL *gifUrl;
@property BOOL isSelected;
@property (weak, nonatomic) IBOutlet UILabel *selectedLabel;

@end
