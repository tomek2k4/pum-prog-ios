//
//  ViewControllerScreen2.m
//  Z32
//
//  Created by IIUJ on 10.01.2015.
//  Copyright (c) 2015 IIUJ. All rights reserved.
//

#import "ViewControllerScreen2.h"

@interface ViewControllerScreen2 ()

@end

@implementation ViewControllerScreen2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label1.text = self.textOnLabel1;
    self.textField2.delegate= self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
