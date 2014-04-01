//
//  AddEquipmentViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-25.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "AddEquipmentViewController.h"
#import "AddEquipmentCell.h"

@interface AddEquipmentViewController ()
{
    NSMutableArray *allEquipments;
}
@end

@implementation AddEquipmentViewController
@synthesize delegate;

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
    
    allEquipments = [[NSMutableArray alloc] initWithObjects:@"设备1", @"设备2", @"设备3", @"设备4", @"设备5", @"设备6", nil];
    
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
    return allEquipments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AddEquipmentCell";
    AddEquipmentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.addEquipmentLabel.text = [allEquipments objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [delegate setValue:[allEquipments objectAtIndex:indexPath.row]];
    NSUInteger row = [indexPath row];
    NSLog(@"%@",self.delegate);
    NSString *rowTitle = [allEquipments objectAtIndex:row];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"添加成功！"
                          message:[NSString stringWithFormat:@"你关注了%@", rowTitle]
                          delegate:self
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil];
    [alert show];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
