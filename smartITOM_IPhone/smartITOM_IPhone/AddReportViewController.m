//
//  AddReportViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-25.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "AddReportViewController.h"
#import "AddReportCell.h"

@interface AddReportViewController ()
{
    NSMutableArray *reports;
}
@end

@implementation AddReportViewController

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
    reports = [[NSMutableArray alloc] initWithObjects:@"报表1", @"报表2", @"报表3", @"报表4", @"报表5", @"报表6", nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return reports.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AddReportCell";
    AddReportCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.addReportLabel.text = [reports objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSString *rowTitle = [reports objectAtIndex:row];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"添加成功！"
                          message:[NSString stringWithFormat:@"你关注了%@", rowTitle]
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles: nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
