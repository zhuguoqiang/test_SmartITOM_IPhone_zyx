//
//  SettingsTableViewCell.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-24.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "SettingsTableViewCell.h"

@implementation SettingsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)switchButton:(UISwitch *)sender
{
    if(sender.on) {
        //        [self.myTableViewsetEditing:YES animated:YES];
        self.settingLabel.text = @"On button";
    } else {
        //        [self.myTableViewsetEditing:NO animated:YES];
        self.settingLabel.text = @"Off button";
    }
    //    BOOL setting = sender.isOn;
    //    [self.leftSwitch setOn:setting animated:YES];
    //    [self.rightSwitch setOn:setting animated:YES];
}

@end