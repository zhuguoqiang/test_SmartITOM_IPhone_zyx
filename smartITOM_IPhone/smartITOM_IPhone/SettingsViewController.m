//
//  SettingsViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-24.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsTableViewCell.h"

@interface SettingsViewController ()
{
    NSMutableArray *buttonArray;
}
@end

@implementation SettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    buttonArray = [NSMutableArray arrayWithObjects:@"On button", @"On button", @"On button", @"On button", @"On button", @"On button", @"On button", @"On button", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return buttonArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SettingsCell";
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
//    cell.newsNames.text = [newsName objectAtIndex:indexPath.row];
//    cell.textLabel.text = [buttonArray objectAtIndex:indexPath.row];
    cell.settingLabel.text = [buttonArray objectAtIndex:indexPath.row];
    
    return cell;
}

@end
