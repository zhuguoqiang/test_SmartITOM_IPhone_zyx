//
//  NewsViewController.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-10.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsTableViewCell.h"
#import "ELineChart.h"

@interface NewsViewController : UITableViewController<ELineChartDataSource,ELineChartDelegate>
@property (strong, nonatomic) ELineChart *eLineChart;

@property (strong, nonatomic) NSArray *eLineChartData;

@property (nonatomic) float eLineChartScale;

@end
