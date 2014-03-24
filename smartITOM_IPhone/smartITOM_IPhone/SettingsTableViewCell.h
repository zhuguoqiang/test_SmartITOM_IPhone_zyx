//
//  SettingsTableViewCell.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-24.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *settingLabel;
- (IBAction)switchButton:(UISwitch *)sender;

@end
