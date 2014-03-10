//
//  HostViewController.m
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-5.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "HostViewController.h"

@interface HostViewController ()

@end

@implementation HostViewController

-(void)setIPLabelText:(NSString *)IPLabelText
{
    self.IPLabel.text = IPLabelText;
}

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
    self.IPLabel.text = self.ipLabelText;
    self.categoryLabel.text = self.categoryLabelText;
    self.manufactoryLabel.text = self.manufactotyLabelText;
    [self.detailView addSubview:self.informationView];
//    NSLog(@"%@",self.IPLabel);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
