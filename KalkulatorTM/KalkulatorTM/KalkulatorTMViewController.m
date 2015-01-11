//
//  KalkulatorViewController.m
//  KalkulatorTM
//
//  Created by Podyplomowe on 14.12.2014.
//  Copyright (c) 2014 Podyplomowe. All rights reserved.
//

#import "KalkulatorTMViewController.h"

@interface KalkulatorTMViewController ()

@end

@implementation KalkulatorTMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self display] setText:@"0"];
    
    __weak NSString *napis1 = @"ABC";
    NSString *napis2 = @"ABC";
    
    NSString *napis3 = napis2;
    
    NSLog(@"Zmienna napis1: %@, adres zmiennej: %p",napis1,napis1);
    NSLog(@"Zmienna napis2: %@, adres zmiennej: %p",napis2,napis2);
    NSLog(@"Zmienna napis3: %@, adres zmiennej: %p",napis3,napis3);
    
    NSString *napis4 = [[NSString alloc] init];
    NSString *napis5;
    
    NSLog(@"Zmienna napis4: %@, adres zmiennej: %p",napis4,napis4);
    NSLog(@"Zmienna napis5: %@, adres zmiennej: %p",napis5,napis5);
    
    int i = 6;
    
    NSString *napis6 = [[NSString alloc] initWithFormat:@"Liczba: %d",i];
    NSString *napis7 = [[NSString alloc] initWithFormat:@"Liczba: %f",32.529];
    
    NSLog(@"Zmienna napis6: %@, adres zmiennej: %p",napis6,napis6);
    NSLog(@"Zmienna napis7: %@, adres zmiennej: %p",napis7,napis7);
    
    
    NSString *napis8 = [NSString stringWithFormat:@"Liczba: %d",i*2];
    NSLog(@"Zmienna napis8: %@, adres zmiennej: %p",napis8,napis8);
    
    NSString *napis9 = [@"ABC" stringByAppendingString:napis1];
    NSLog(@"Zmienna napis9: %@, adres zmiennej: %p",napis9,napis9);
    
    napis9 = napis1;
    
    napis9 = nil;
    napis1 = nil;
    
    
}


- (IBAction)digitPressed:(UIButton *)sender {
    
    if ([sender.titleLabel.text isEqual: @"c"]) {
        self.display.text = @"0";
        return;
    }
    
    if ([self.display.text  isEqual: @"0"]) {
        self.display.text = sender.titleLabel.text;
    }else {
        self.display.text = [self.display.text stringByAppendingString:sender.titleLabel.text];
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
