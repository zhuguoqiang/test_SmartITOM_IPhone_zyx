//
//  AttentionViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-21.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "AttentionViewController.h"

@interface AttentionViewController ()
{
    NSMutableArray *equipments;
    NSMutableArray *reports;
}
@end

@implementation AttentionViewController

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
    
//    self.equipments = @[@"English", @"French", @"German", @"Spanish"];
//    self.reports = @[@"en", @"fr", @"de", @"es"];
    equipments = [[NSMutableArray alloc] initWithObjects:@"思科路由器MD131", @"联想主机E49", @"MySql", @"iMac", @"IBM服务器", nil];
    reports = [[NSMutableArray alloc] initWithObjects:@"Mem Top 10", @"Cpu Top 10", @"告警 Top 10", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return equipments.count;
    }else{
        return reports.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AttentionCell";
    AttentionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (indexPath.section == 0) {
        cell.attentionLabel.text = [equipments objectAtIndex:indexPath.row];
    }else{
        cell.attentionLabel.text = [reports objectAtIndex:indexPath.row];
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"icon" ofType:@"png"];
    [cell.attentionIcon setImage:[UIImage imageWithContentsOfFile:path]];
    // Configure the cell...
    
    return cell;
}

//返回标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"设备";
    }else{
        return @"报表";
    }
}

//判断设备和报表
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        [self performSegueWithIdentifier:@"Equipments" sender:self];
    }
    else if (indexPath.section == 1)
    {
        [self performSegueWithIdentifier:@"Reports" sender:self];
    }
}


@end
