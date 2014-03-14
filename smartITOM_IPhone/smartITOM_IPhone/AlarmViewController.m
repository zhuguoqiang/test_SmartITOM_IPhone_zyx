//
//  AlarmViewController.m
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-5.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "AlarmViewController.h"

@interface AlarmViewController ()
{
    UIView *alarmView;
}
@end

@implementation AlarmViewController

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
	
    self.IPLabel.text = self.IPLabelText;
    self.categoryLabel.text = self.categoryLabelText;
    self.manufactotyLabel.text = self.manufactoryLabelText;
//    [self.detailView addSubview:self.informationView];
    
    alarmView = [[UIView alloc] initWithFrame:CGRectMake(0, 170, 320, 160)];
    alarmView.layer.borderWidth = 1;
    alarmView.layer.borderColor = [[UIColor blueColor] CGColor];
    UILabel *fLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 50)];
    fLabel.text = @"Flowserve";
    fLabel.textColor = [UIColor redColor];
    fLabel.font = [UIFont fontWithName:nil size:50];
    UILabel *ffLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 200, 50)];
    ffLabel.text = @"内存利用率阀值越界";
    ffLabel.font = [UIFont fontWithName:nil size:40];
    
    [alarmView addSubview:fLabel];
    [alarmView addSubview:ffLabel];
    
    [self.view addSubview:alarmView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
