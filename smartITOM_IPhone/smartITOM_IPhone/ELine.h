//
//  ELine.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-12.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELineChartDataModel.h"

@class ELine;
@class ELineChart;

@protocol ELineDataSource <NSObject>

@required

- (NSInteger) numberOfPointsInELine:(ELine *)eLine;

- (ELineChartDataModel *) highestValueInELine:(ELine *)eLine;

- (ELineChartDataModel *) eLine:(ELine *) eLine
                  valueForIndex:(NSInteger) index;

@end

@interface ELine : UIView

@property (strong, nonatomic) CAShapeLayer *shapeLayer;

@property (strong, nonatomic) UIView *dot;

@property (nonatomic) NSInteger lineWidth;

@property (strong, nonatomic) UIColor *lineColor;

@property (weak, nonatomic) id <ELineDataSource> dataSource;

- (id)initWithFrame:(CGRect)frame
          lineColor:(UIColor *)color
          lineWidth:(NSInteger)lineWidth;

- (void) putDotAt:(NSInteger) index;

- (void) reloadDataWithAnimation: (BOOL) shouldAnimation;

@end