//
//  AttentionViewController.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-21.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttentionTableViewCell.h"
#import "AddEquipmentViewController.h"
#import "AddReportViewController.h"

@interface AttentionViewController : UITableViewController<UIActionSheetDelegate, insertObject>
//@property (strong, nonatomic) NSArray *equipments;
//@property (strong, nonatomic) NSArray *reports;
@property (strong, nonatomic) UIBarButtonItem *addButton;

@end
