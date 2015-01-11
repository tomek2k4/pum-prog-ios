//
//  ViewControllerScreen2.m
//  Projekt2
//
//  Created by Podyplomowe on 10.01.2015.
//  Copyright (c) 2015 Podyplomowe. All rights reserved.
//

#import "ViewControllerScreen2.h"

@interface ViewControllerScreen2 ()

@end

@implementation ViewControllerScreen2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label.text = self.textOnLabel;
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
