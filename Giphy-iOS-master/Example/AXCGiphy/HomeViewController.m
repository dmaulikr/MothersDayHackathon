//
//  HomeViewController.m
//  AXCGiphy
//
//  Created by Jo Tu on 5/5/16.
//  Copyright © 2016 Alex Choi. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
  

}

- (IBAction)searchButton:(id)sender {
    NSLog(@"%@",self.text1.text);

     self.string1 = [self.text1.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string2 = [self.text2.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string3 = [self.text3.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string4 = [self.text4.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string5 = [self.text5.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSLog(@"%@\n%@\n%@\n%@\n%@",self.string1, self.string2,self.string3,self.string4,self.string5);
    
}
@end
