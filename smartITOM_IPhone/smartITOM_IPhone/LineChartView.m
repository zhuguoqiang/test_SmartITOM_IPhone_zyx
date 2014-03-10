//
//  LineChartView.m
//  MyFirstArchiever
//
//  Created by Apple001 on 14-3-4.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import "LineChartView.h"

@interface LineChartView()
{
    CALayer *linesLayer;
    UIView *popView;
    UILabel *disLabel;
}

@end

@implementation LineChartView

@synthesize array;
@synthesize hDesc,vDesc,hInterval,vInterval;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        
        hInterval = 10;
        vInterval = 50;
        
        linesLayer = [[CALayer alloc] init];
        
        linesLayer.masksToBounds = YES;
        linesLayer.contentsGravity = kCAGravityLeft;
        linesLayer.backgroundColor = [UIColor whiteColor].CGColor;
        
        [self.layer addSublayer:linesLayer];
        
        //Popview
        
        popView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        [popView setBackgroundColor:[UIColor blackColor]];
        [popView setAlpha:0.0f];
         
         disLabel = [[UILabel alloc] initWithFrame:popView.frame];
         [popView addSubview:disLabel];
         [self addSubview:popView];
         
         
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [self setClearsContextBeforeDrawing:YES];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef backColorRef = [UIColor blackColor].CGColor;
    //线宽
    CGFloat backLineWidth = 2.f;
    //投影
    CGFloat backMiterLimit = 0.f;
    
    CGContextSetLineWidth(context, backLineWidth);
    CGContextSetMiterLimit(context, backMiterLimit);
     //所有绘图的像素点都会按指定的偏移（向右偏3，向下偏5） 指定的宽度（粗细8像素） 指定的颜色（黑色） 形成投影效果
    CGContextSetShadowWithColor(context, CGSizeMake(3, 5), 8, backColorRef);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    //设置图形混合模式，默认是Normal
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    int x = 320;
    int y = 460;
    
    for (int i = 0 ; i < vDesc.count; i++)
    {
        CGPoint bPoint = CGPointMake(30, y);
        CGPoint ePoint = CGPointMake(x, y);
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [label setCenter:CGPointMake(bPoint.x-15, bPoint.y-30)];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor whiteColor]];
        [label setText:[vDesc objectAtIndex:i]];
        [self addSubview:label];
        
        CGContextMoveToPoint(context, bPoint.x, bPoint.y-30);
        CGContextAddLineToPoint(context, self.frame.size.width, ePoint.y-30);
        
        y -= 50;
        
    }
    
    for (int i=0; i<array.count-1; i++)
    {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i*vInterval+30, 440, 40, 30)];
//        [label setTextAlignment:UITextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor whiteColor]];
        label.numberOfLines = 1;
        label.adjustsFontSizeToFitWidth = YES;
//        label.minimumFontSize = 1.0f;
        [label setText:[hDesc objectAtIndex:i]];
        
        [self addSubview:label];
    }
    
    //    //画点线条------------------
    CGColorRef pointColorRef = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0].CGColor;
    CGFloat pointLineWidth = 1.5f;
    CGFloat pointMiterLimit = 5.0f;
    
    CGContextSetLineWidth(context, pointLineWidth);//主线宽度
    CGContextSetMiterLimit(context, pointMiterLimit);//投影角度
    
    
    CGContextSetShadowWithColor(context, CGSizeMake(3, 5), 8, pointColorRef);//设置双条线
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGContextSetLineCap(context, kCGLineCapRound );
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    
	//绘图
	CGPoint p1 = [[array objectAtIndex:0] CGPointValue];
	int i = 1;
	CGContextMoveToPoint(context, p1.x+30, 430-p1.y);
	for (; i<[array count]; i++)
	{
		p1 = [[array objectAtIndex:i] CGPointValue];
        CGPoint goPoint = CGPointMake(p1.x, 430-p1.y*vInterval/20);
		CGContextAddLineToPoint(context, goPoint.x, goPoint.y);;
    }
    
	CGContextStrokePath(context);
}


@end
