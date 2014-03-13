//
//  ItsmCell.h
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-5.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItsmCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *user;
//@property (strong, nonatomic) IBOutlet UILabel *detailMessage;
@property (strong, nonatomic) IBOutlet UITextView *detailMessage;
@property (strong, nonatomic) IBOutlet UILabel *time;

@end
