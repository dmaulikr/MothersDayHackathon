//
//  HomeViewController.m
//  AXCGiphy
//
//  Created by Jo Tu on 5/5/16.
//  Copyright © 2016 Alex Choi. All rights reserved.
//

#import "HomeViewController.h"
#import "AXCViewController.h"

@interface HomeViewController()
@property (nonatomic) NSMutableArray *strings;
@end
@implementation HomeViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.strings = [[NSMutableArray alloc] init];

}

- (IBAction)searchButton:(id)sender {
    

     self.string1 = [self.text1.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string2 = [self.text2.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string3 = [self.text3.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string4 = [self.text4.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
     self.string5 = [self.text5.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    [self.strings addObject:self.string1];
    [self.strings addObject:self.string2];
    [self.strings addObject:self.string3];
    [self.strings addObject:self.string4];
    [self.strings addObject:self.string5];

    
    for (NSString *string in self.strings) {
        if ([string isEqualToString:@""]) {
            NSLog(@"enter something for everything");
            return;
        } else {
            
            [self performSegueWithIdentifier:@"homeSegue" sender:self];

        }
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[self view] endEditing:TRUE];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    AXCViewController *dest = [segue destinationViewController];
    
    dest.keyword1 = [self.text1.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    dest.keyword2 = [self.text2.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    dest.keyword3 = [self.text3.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    dest.keyword4 = [self.text4.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    dest.keyword5 = [self.text5.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];

    
}
@end
