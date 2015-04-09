//
//  ViewControllerScreen2.h
//  Z32
//
//  Created by IIUJ on 10.01.2015.
//  Copyright (c) 2015 IIUJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerScreen2 : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (strong,nonatomic) NSString *textOnLabel1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@end
