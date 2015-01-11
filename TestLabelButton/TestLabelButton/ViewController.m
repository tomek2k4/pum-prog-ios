//
//  ViewController.m
//  TestLabelButton
//
//  Created by Podyplomowe on 10.01.2015.
//  Copyright (c) 2015 Podyplomowe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1Pressed:(UIButton *)sender {
     self.label.text =  sender.titleLabel.text;
}


- (IBAction)button2Pressed:(UIButton *)sender {
    [[self label] setText:[[sender titleLabel] text]];
}

- (IBAction)digitPressed:(UIButton *)sender {
    
    //    [[self display] setText:[[sender titleLabel] text]];
    
    self.label.text =  sender.titleLabel.text;
    
}

@end
