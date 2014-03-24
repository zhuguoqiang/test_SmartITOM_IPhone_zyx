//
//  FeedbackViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-24.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

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
	self.sendButton = [[UIBarButtonItem alloc] initWithTitle:@"发送"
                                                       style:UIBarButtonItemStyleBordered
                                                      target:self
                                                      action:@selector(sentOpinion)];
    self.navigationItem.rightBarButtonItem = self.sendButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sentOpinion
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"发送成功！"
                          message:[NSString stringWithFormat:@"我们将尽快处理。"]
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles: nil];
    [alert show];
}
@end
