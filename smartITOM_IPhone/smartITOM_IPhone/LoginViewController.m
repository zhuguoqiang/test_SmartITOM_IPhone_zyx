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
#import <sqlite3.h>

@interface LoginViewController ()
{
    sqlite3 *userDB;
    NSString *databasePath;

}
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
    
    //创建一个数据库users
    NSArray *dirPaths;
    NSString *docsDir;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"SmartITOM.db"]];
    
    //输出数据库文件的路径
//    NSLog(@"%@",databasePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //判断是否成功创建数据库
    if ([fileManager fileExistsAtPath:databasePath] == NO)
    {
        //打开数据库，这里的[databasePath UTF8String]是将NSString转换为C字符串，因为SQLite3是采用可移植的C(而不是
        //Objective-C)编写的，它不知道什么是NSString.
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &userDB)==SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS tb_user(ID INTEGER PRIMARY KEY AUTOINCREMENT, USERNAME TEXT, PASSWORD TEXT)";
            if (sqlite3_exec(userDB, sql_stmt, NULL, NULL, &errMsg)!=SQLITE_OK) {
                NSLog(@"创建表失败\n");
            }
        }
        else
        {
            NSLog(@"创建/打开数据库失败\n");
        }
    }

    //为登录面添加密码，不用时可删除
//    self.username.text = @"admin";
//    self.password.text = @"123456";
    self.username.text = @"";
    self.password.text = @"";
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
    
    //用户名添加软键盘的清空、空格和完成键
    UIToolbar * usernameView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [usernameView setBarStyle:UIBarStyleBlack];
    UIBarButtonItem * clearUsernameButton = [[UIBarButtonItem alloc]initWithTitle:@"清空" style:UIBarButtonItemStyleBordered target:self action:@selector(clearUsername)];
    UIBarButtonItem * btnSpace1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneUsernameButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    NSArray * usernameArray = [NSArray arrayWithObjects:clearUsernameButton,btnSpace1,doneUsernameButton,nil];
    [usernameView setItems:usernameArray];
    [self.username setInputAccessoryView:usernameView];
    
    //密码添加软键盘的清空、空格和完成键
    UIToolbar * passwordView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [passwordView setBarStyle:UIBarStyleBlack];
    UIBarButtonItem * clearPasswordButton = [[UIBarButtonItem alloc]initWithTitle:@"清空" style:UIBarButtonItemStyleBordered target:self action:@selector(clearPassword)];
    UIBarButtonItem * btnSpace2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * donePasswordButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    NSArray * passwordArray = [NSArray arrayWithObjects:clearPasswordButton,btnSpace2,donePasswordButton,nil];
    [passwordView setItems:passwordArray];
    [self.password setInputAccessoryView:passwordView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//清空用户名输入内容
- (IBAction)clearUsername
{
    self.username.text = nil;
}

//清空密码输入内容
- (IBAction)clearPassword
{
    self.password.text = nil;
}

//退出键盘
- (IBAction)dismissKeyBoard
{
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
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
    if ([self.username.text isEqualToString:@""] || [self.password.text isEqualToString:@""])
//    if (([self.username.text length] == 0) || ([self.password.text length] == 0))
    {
        UIAlertView *judgeLogin = [[UIAlertView alloc]initWithTitle:@"登录提示"
                                                            message:@"用户名或密码不能为空！"
                                                           delegate:self
                                                  cancelButtonTitle:@"取消"
                                                  otherButtonTitles:@"确定",nil];
        [judgeLogin show];
        
    }
    else
    {
        const char *dbpath = [databasePath UTF8String];
        sqlite3_stmt *statement;
        
        if (sqlite3_open(dbpath, &userDB) == SQLITE_OK)
        {
            NSString *querySQL = [NSString stringWithFormat:@"SELECT PASSWORD FROM tb_user WHERE USERNAME=\"%@\"", self.username.text];
            const char *query_stmt = [querySQL UTF8String];
            if (sqlite3_prepare_v2(userDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
            {
                if (sqlite3_step(statement) == SQLITE_ROW)
                {
                    NSString *passwordField = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                    if ([self.password.text isEqualToString:passwordField]) {
                        [self performSegueWithIdentifier:@"login" sender:self];
                        NSLog(@"登录成功！\n");
                    }
                }
                else
                {
                    UIAlertView *alertLogin = [[UIAlertView alloc]initWithTitle:@"登录提示"
                                                                        message:@"用户名或密码错误！"
                                                                       delegate:self
                                                              cancelButtonTitle:@"取消"
                                                              otherButtonTitles:@"确定",nil];
                    [alertLogin show];
                }
                sqlite3_finalize(statement);
            }
            sqlite3_close(userDB);
        }
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
