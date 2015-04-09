//
//  ViewController.m
//  Z32
//
//  Created by IIUJ on 10.01.2015.
//  Copyright (c) 2015 IIUJ. All rights reserved.
//

#import "ViewControllerScreen1.h"
#import "ViewControllerScreen2.h"

@interface ViewControllerScreen1 ()

@end

@implementation ViewControllerScreen1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField1.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}
- (IBAction)backgroundTouched:(UIControl *)sender {
    [self.view endEditing:YES];
}

-(IBAction)powrotZEkranu2:(UIStoryboardSegue *)sender{
    ViewControllerScreen2 *svc = (ViewControllerScreen2 *)[sender sourceViewController];
    self.label.text = svc.textField2.text;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([[segue identifier] isEqualToString:@"Z ekranu 1 do 2"]) {
        ViewControllerScreen2 * dvc = (ViewControllerScreen2 *)([segue destinationViewController]);
        dvc.textOnLabel1 = self.textField1.text;
    }
    
    /* Można też tak:
    UIViewController * dvc = [segue destinationViewController];
    if ([dvc isMemberOfClass:[ViewControllerScreen2 class]]) {
        [(ViewControllerScreen2 *)dvc setTextOnLabel1:self.textField1.text];
    }
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
