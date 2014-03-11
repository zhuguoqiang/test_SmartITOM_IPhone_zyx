//
//  NewsTableViewCell.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-10.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *newsNames;
@property (strong, nonatomic) IBOutlet UILabel *newsTimes;
@property (strong,nonatomic) IBOutlet UIView *view;

@end
