//
//  HomeViewController.h
//  AXCGiphy
//
//  Created by Jo Tu on 5/5/16.
//  Copyright © 2016 Alex Choi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;
@property (weak, nonatomic) IBOutlet UITextField *text3;
@property (weak, nonatomic) IBOutlet UITextField *text4;
@property (weak, nonatomic) IBOutlet UITextField *text5;
- (IBAction)searchButton:(id)sender;

@property (weak, nonatomic) NSString *string1;
@property (weak, nonatomic) NSString *string2;

@property (weak, nonatomic)  NSString *string3;
@property (weak, nonatomic)  NSString *string4;
@property (weak, nonatomic)  NSString *string5;



@end
