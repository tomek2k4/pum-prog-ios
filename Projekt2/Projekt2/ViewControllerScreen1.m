//
//  ViewController.m
//  Projekt2
//
//  Created by Podyplomowe on 10.01.2015.
//  Copyright (c) 2015 Podyplomowe. All rights reserved.
//

#import "ViewControllerScreen1.h"
#import "ViewControllerScreen2.h"

@interface ViewControllerScreen1 ()

@end

@implementation ViewControllerScreen1

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.textField1.delegate = self;
    
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];

    return YES;
}

- (IBAction)clickBackround:(UIControl *)sender {
    [self.view endEditing:YES];
}

-(IBAction)powrotZEkranu2:(UIStoryboardSegue *)sender{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([[segue identifier] isEqualToString:@"jedenDoDwa"]) {
//        ViewControllerScreen2 * dvc =(ViewControllerScreen2 *) ([segue destinationViewController]);
//        dvc.textOnLabel = self.textField1.text;
//    }
    
    
    UIViewController *dvc = [segue destinationViewController];
    if ([dvc isMemberOfClass:[ViewControllerScreen2 class]]) {
        [(ViewControllerScreen2 *)dvc setTextOnLabel:self.textField1.text];
    }
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
