//
//  AlarmViewController.h
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-5.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *IPLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet UILabel *manufactotyLabel;
//@property (strong, nonatomic) IBOutlet UIView *detailView;

@property (strong,nonatomic) NSString *IPLabelText;
@property (strong,nonatomic) NSString *categoryLabelText;
@property (strong,nonatomic) NSString *manufactoryLabeltext;
//@property (strong,nonatomic) UIView *informationView;


@end
