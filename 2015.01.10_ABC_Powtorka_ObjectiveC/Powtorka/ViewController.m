//
//  ViewController.m
//  Powtorka
//
//  Created by IIUJ on 10.01.2015.
//  Copyright (c) 2015 IIUJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.display.text = @"nic";
    [self.buttonP2 addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)updateDisplay:(UIButton *)sender {
    
    self.display.text = sender.titleLabel.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
