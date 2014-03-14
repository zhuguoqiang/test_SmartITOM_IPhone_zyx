//
//  HostViewController.h
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-5.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELineChart.h"

@interface HostViewController : UIViewController<ELineChartDataSource,ELineChartDelegate>
@property (strong, nonatomic) IBOutlet UILabel *IPLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet UILabel *manufactoryLabel;

@property (strong, nonatomic) NSString *ipLabelText;
@property (strong, nonatomic) NSString *categoryLabelText;
@property (strong, nonatomic) NSString *manufactotyLabelText;

@property (strong, nonatomic) ELineChart *eLineChart;
@property (strong, nonatomic) NSArray *eLineChartData;
@property (strong, nonatomic) NSMutableArray *views;

//@property (strong,nonatomic) UIView *informationView;
//@property (strong, nonatomic) IBOutlet UIView *detailView;


@end
