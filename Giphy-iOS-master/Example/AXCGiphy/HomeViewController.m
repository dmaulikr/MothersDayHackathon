//
//  HomeViewController.m
//  AXCGiphy
//
//  Created by Jo Tu on 5/5/16.
//  Copyright © 2016 Alex Choi. All rights reserved.
//

#import "HomeViewController.h"
#import "AXCViewController.h"

@implementation HomeViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
  

}

- (IBAction)searchButton:(id)sender {

     self.string1 = [self.text1.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string2 = [self.text2.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string3 = [self.text3.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string4 = [self.text4.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string5 = [self.text5.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    if ([segue.identifier isEqualToString:@"segue"])
    {
        AXCViewController *dest = [segue destinationViewController];
        
        dest.keyword1 = [self.text1.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        dest.keyword2 = [self.text2.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        dest.keyword3 = [self.text3.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        dest.keyword4 = [self.text4.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        dest.keyword5 = [self.text5.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];

        [self performSegueWithIdentifier:@"segue" sender:self];
    }
    
    
}
@end
