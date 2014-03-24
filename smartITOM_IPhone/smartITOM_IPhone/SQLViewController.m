//
//  SQLViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-24.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "SQLViewController.h"

@interface SQLViewController ()

@end

@implementation SQLViewController

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
	self.writeTextView.text = [NSString stringWithFormat:@"SELECT * FROM table_name"];
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleBlack];
    
    //添加软键盘的清空、空格和完成键
    UIBarButtonItem * clearButton = [[UIBarButtonItem alloc]initWithTitle:@"清空" style:UIBarButtonItemStyleBordered target:self action:@selector(clearStatement)];
    
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:clearButton,btnSpace,doneButton,nil];
    [topView setItems:buttonsArray];
    [self.writeTextView setInputAccessoryView:topView];
}

//清空输入内容
- (IBAction)clearStatement
{
    self.writeTextView.text = @"";
}

//退出键盘
- (IBAction)dismissKeyBoard
{
    [self.writeTextView resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)executeButton:(id)sender
{
    NSString *statement = self.writeTextView.text;
    self.resultTextView.text = [NSString stringWithFormat:@"执行结果：%@",statement];
}
@end
