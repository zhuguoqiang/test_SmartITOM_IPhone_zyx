//
//  LoginViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-4.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "LoginViewController.h"
#import "EChartViewController.h"

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
	// Do any additional setup after loading the view.
    NSString *filePath = [self documentsPath:@"user.txt"];
    NSArray *user = [NSArray arrayWithContentsOfFile:filePath];
    self.username.text = @"admin";
    self.password.text = [user objectAtIndex:1];
    
    self.password.secureTextEntry = YES;
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
        
        NSLog(@"登陆成功！\n");
        
    }
    else
    {
        NSLog(@"用户名或密码错误！\n");
        UIAlertView *judgeLogin = [[UIAlertView alloc]initWithTitle:@"提示"
                                               message:@"用户名或密码错误！"
                                              delegate:self
                                     cancelButtonTitle:@"取消"
                                     otherButtonTitles:@"确定",nil];
        [judgeLogin show];
        
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
