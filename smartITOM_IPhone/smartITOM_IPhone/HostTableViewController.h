//
//  HostTableViewController.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-14.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HostCell.h"
#import "ELineChart.h"

@interface HostTableViewController : UITableViewController<ELineChartDataSource,ELineChartDelegate>

@property (strong, nonatomic) ELineChart *eLineChart;
@property (strong, nonatomic) NSArray *eLineChartData;
@property (nonatomic) float eLineChartScale;
@property (strong,nonatomic) NSMutableArray *views;

@end
