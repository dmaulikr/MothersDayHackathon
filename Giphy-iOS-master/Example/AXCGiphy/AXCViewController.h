//
//  AXCViewController.h
//  AXCGiphy
//
//  Created by Alex Choi on 08/19/2014.
//  Copyright (c) 2014 Alex Choi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AXCViewController : UIViewController

@property (nonatomic, strong) NSString *keyword1;
@property (nonatomic, strong) NSString *keyword2;
@property (nonatomic, strong) NSString *keyword3;
@property (nonatomic, strong) NSString *keyword4;
@property (nonatomic, strong) NSString *keyword5;

@property (nonatomic, strong) NSMutableArray *gifArrayKeyword1;
@property (nonatomic, strong) NSMutableArray *gifArrayKeyword2;
@property (nonatomic, strong) NSMutableArray *gifArrayKeyword3;
@property (nonatomic, strong) NSMutableArray *gifArrayKeyword4;
@property (nonatomic, strong) NSMutableArray *gifArrayKeyword5;

@end
