//
//  LoginViewController.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-4.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    BOOL rememberPassword;
    BOOL automaticLogin;
}
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *btnRememberPassword;
@property (strong, nonatomic) IBOutlet UIButton *btnAutomaticLogin;
@property (strong, nonatomic) IBOutlet UIView *loginView;

- (IBAction)loginPress:(UIButton *)sender;
- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundTip:(id)sender;
- (IBAction)rememberPassword:(UIButton *)sender;
- (IBAction)automaticLogin:(UIButton *)sender;
@end
