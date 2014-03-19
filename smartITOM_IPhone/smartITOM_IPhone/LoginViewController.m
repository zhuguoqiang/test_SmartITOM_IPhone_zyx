//
//  LoginViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-4.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "LoginViewController.h"
#import "EChartViewController.h"
#import "Prefs.h"
#import "CHKeychain.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.username.text = @"admin";
    self.password.text = @"123456";
//    self.password.text = [user objectAtIndex:1];
    self.password.secureTextEntry = YES;
    
    //默认记住密码和自动登录
    rememberPassword = YES;
    automaticLogin = YES;
    //设置记住密码和自动登录的图片
    [self.btnRememberPassword setBackgroundImage:[UIImage imageNamed:@"checkbox_nor.png"] forState:UIControlStateNormal];
    [self.btnRememberPassword setBackgroundImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateSelected];
    [self.btnRememberPassword setBackgroundImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateHighlighted];
    self.btnRememberPassword.adjustsImageWhenHighlighted = YES;
    self.btnRememberPassword.selected = rememberPassword;
    
    [self.btnAutomaticLogin setBackgroundImage:[UIImage imageNamed:@"checkbox_nor.png"] forState:UIControlStateNormal];
    [self.btnAutomaticLogin setBackgroundImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateSelected];
    [self.btnAutomaticLogin setBackgroundImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateHighlighted];
    self.btnAutomaticLogin.adjustsImageWhenHighlighted = YES;
    self.btnAutomaticLogin.selected = automaticLogin;
    
    self.loginView.backgroundColor = [UIColor whiteColor];
    //设置uiview的阴影
    [[self.loginView layer] setShadowOffset:CGSizeMake(1, 1)];
    [[self.loginView layer] setShadowRadius:5];
    [[self.loginView layer] setShadowOpacity:1];
    [[self.loginView layer] setShadowColor:[UIColor grayColor].CGColor];
    //设置uiview的边框
    [[self.loginView layer] setCornerRadius:5];
    [[self.loginView layer] setBorderWidth:2];
    [[self.loginView layer] setBorderColor:[UIColor blackColor].CGColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)backgroundTip:(id)sender
{
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
}

//设置记住密码图片切换
- (IBAction)rememberPassword:(UIButton *)sender
{
    rememberPassword = (!rememberPassword);
    [self.btnRememberPassword setSelected:rememberPassword];
}

//设置自动登录图片切换
- (IBAction)automaticLogin:(UIButton *)sender
{
    automaticLogin = (!automaticLogin);
    [self.btnAutomaticLogin setSelected:automaticLogin];
}


- (IBAction)loginPress:(UIButton *)sender
{
    
//    NSString *filePath = [self documentsPath:@"user.txt"];
//    //从user这个文件里读出用户名和密码是否与输入的相同
//    NSArray *user = [NSArray arrayWithContentsOfFile:filePath];
//    NSLog(@"%@",filePath);
//    if([self.username.text isEqualToString:[user objectAtIndex:0]] && [self.password.text isEqualToString:[user objectAtIndex:1]])
//    {
    if ([self.username.text isEqual:@"admin"] && [self.password.text isEqualToString:@"123456"])
    {
        //如果验证正确，则重新打开一个窗口
        [self performSegueWithIdentifier:@"login" sender:self];
        NSLog(@"登录成功！\n");
    }
    else if ([self.username.text isEqual:@""] || [self.password.text isEqual:@""])
    {
        NSLog(@"用户名或密码不能为空！\n");
        UIAlertView *judgeLogin = [[UIAlertView alloc]initWithTitle:@"登录提示"
                                                            message:@"用户名或密码不能为空！"
                                                           delegate:self
                                                  cancelButtonTitle:@"取消"
                                                  otherButtonTitles:@"确定",nil];
        [judgeLogin show];
    }
    else
    {
        NSLog(@"用户名或密码错误！\n");
        UIAlertView *judgeLogin = [[UIAlertView alloc]initWithTitle:@"登录提示"
                                               message:@"用户名或密码错误！"
                                              delegate:self
                                     cancelButtonTitle:@"取消"
                                     otherButtonTitles:@"确定",nil];
        [judgeLogin show];
    }
    
    //登录成功之后记录密码
	if (rememberPassword) {
		NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
		[usernamepasswordKVPairs setObject:self.username.text forKey:KEY_USERNAME];
		[usernamepasswordKVPairs setObject:self.password.text forKey:KEY_PASSWORD];
		[CHKeychain save:KEY_USERNAME_PASSWORD data:usernamepasswordKVPairs];
	}else {
		[CHKeychain delete:KEY_USERNAME_PASSWORD];
	}

}

//-(NSString *)bundlePath:(NSString *)fileName
//{
//    return [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:fileName];
//}

-(NSString *)documentsPath:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

//-(NSString *)documentsPath
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    return documentsDirectory;
//}

@end
