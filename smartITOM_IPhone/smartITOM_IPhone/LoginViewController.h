//
//  LoginViewController.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-4.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)loginPress:(UIButton *)sender;
- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundTip:(id)sender;
@end
