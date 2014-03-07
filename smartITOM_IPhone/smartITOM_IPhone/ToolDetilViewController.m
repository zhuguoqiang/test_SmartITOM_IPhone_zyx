//
//  ToolDetilViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-7.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "ToolDetilViewController.h"

@interface ToolDetilViewController ()

@end

@implementation ToolDetilViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showTitle:(NSString *)title
{
    self.title = title;
}

@end
