//
//  ToolViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-7.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "ToolViewController.h"
#import "ToolDetilViewController.h"

@interface ToolViewController ()
{
    NSArray *array;
    //    NSArray *array1;
    //    NSArray *array2;
}
@end

@implementation ToolViewController

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
    array = [NSArray arrayWithObjects:@"Shell工具", @"SQL", @"telnet", @"设置", nil];
    //    array1 = [NSArray arrayWithObjects:@"Shell工具", @"SQL", @"telnet", @"设置", nil];
    //    array2 = [NSArray arrayWithObjects:@"意见反馈", @"关于我们", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation !=UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 返回组的数量
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 返回section组的子项数量
    return array.count;
    //    return array1.count+array2.count;
}

//返回当前分组的组名
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"第%d组",section+1];
}

//返回具体的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //可以随便填tableview，通过这个identifier来复用你的控件，如果你有跳转的一些事件，要跟界面上的一致
    static NSString *CellIdentifier = @"toolCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        //初始化tableviewcell 主要是 style  显示的样式
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    //设置cell内容
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [array objectAtIndex:indexPath.row];
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
//通过 segue跳转的 回调方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TableCellToDetil"])
    {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        NSInteger row = path.row;
        NSString *title = [NSString stringWithFormat:@"第%d组, %@",path.section+1,
                           [array objectAtIndex:row]];
        [segue.destinationViewController showTitle:title];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
