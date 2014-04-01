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
    
    self.addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                   target:self
                                                                   action:@selector(showSheet)];
    self.navigationItem.rightBarButtonItem = self.addButton;
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


- (IBAction)showSheet
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择添加内容"
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:@"确定"
//                                                    cancelButtonTitle:nil
//                                               destructiveButtonTitle:@"取消"
                                                    otherButtonTitles:@"设备", @"报表", nil];
    //actionSheet不同的格式
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
//    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
//    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
//    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
}

-(void)showAlert:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Action Sheet选择项"
                          message:msg
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles: nil];
    [alert show];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self showAlert:@"确定"];
    }
    else if(buttonIndex == 1) {
        [self performSegueWithIdentifier:@"AddEquipment" sender:self];
    }
    else if(buttonIndex == 2) {
        [self performSegueWithIdentifier:@"AddReport" sender:self];
    }
    else if(buttonIndex == 3){
        [self showAlert:@"取消"];
    }
    
}

#pragma mark -insertObject
-(void)setValue:(NSString *)object
{
    NSArray *array = [[NSArray alloc] initWithArray:equipments];
    int flag = 0;
    for (NSString *string in array)
    {
        if ([string isEqualToString:object])
            flag = 1;
    }
    if (flag == 0)
    {
        [equipments addObject:object];
    }
    [self.tableView reloadData];
    NSLog(@"chenggong");
}


@end
