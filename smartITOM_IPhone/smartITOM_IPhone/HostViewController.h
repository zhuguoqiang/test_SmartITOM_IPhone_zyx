//
//  HostViewController.h
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-5.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HostViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *IPLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet UILabel *manufactoryLabel;

@property (strong,nonatomic) NSString *ipLabelText;
@property (strong,nonatomic) NSString *categoryLabelText;
@property (strong,nonatomic) NSString *manufactotyLabelText;
@property (strong,nonatomic) UIView *informationView;
@property (strong, nonatomic) IBOutlet UIView *detailView;


@end
