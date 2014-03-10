//
//  LineChartView.h
//  MyFirstArchiever
//
//  Created by Apple001 on 14-3-4.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineChartView : UIView

@property (assign) NSInteger hInterval;
@property (assign) NSInteger vInterval;

@property (nonatomic,strong) NSArray *hDesc;
@property (nonatomic,strong) NSArray *vDesc;

@property (nonatomic,strong) NSArray *array;

@end
