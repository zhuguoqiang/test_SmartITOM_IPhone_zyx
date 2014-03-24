//
//  AddAttentionViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-21.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "AddAttentionViewController.h"

@interface AddAttentionViewController ()
{
    NSMutableArray *equipments;
}
@end

@implementation AddAttentionViewController

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
    equipments = [[NSMutableArray alloc] initWithObjects:@"设备1", @"设备2", @"设备3", @"设备4", @"设备5", @"设备6", nil];
    
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
    return equipments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AddAttentionCell";
    AddAttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.addAttentionLabel.text = [equipments objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSString *rowTitle = [equipments objectAtIndex:row];
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
