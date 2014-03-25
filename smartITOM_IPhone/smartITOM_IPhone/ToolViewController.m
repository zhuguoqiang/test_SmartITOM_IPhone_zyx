//
//  ToolViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-7.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "ToolViewController.h"

@interface ToolViewController ()
{
    NSMutableArray *array1;
    NSMutableArray *array2;
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
//    array = [NSArray arrayWithObjects:@"Shell工具", @"SQL", @"telnet", @"设置", nil];
    array1 = [NSMutableArray arrayWithObjects:@"Shell工具", @"SQL", @"telnet", @"设置", nil];
    array2 = [NSMutableArray arrayWithObjects:@"意见反馈", @"关于我们", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//选择跳转的controller
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self performSegueWithIdentifier:@"ShellTool" sender:self];
        }
        else if (indexPath.row == 1) {
            [self performSegueWithIdentifier:@"SQL" sender:self];
        }
        else if (indexPath.row == 2) {
            [self performSegueWithIdentifier:@"Telnet" sender:self];
        }
        else {
            [self performSegueWithIdentifier:@"Settings" sender:self];
        }
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            [self performSegueWithIdentifier:@"Feedback" sender:self];
        }
        else if (indexPath.row == 1){
            [self performSegueWithIdentifier:@"AboutUs" sender:self];
        }
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation !=UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 返回组的数量
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 返回section组的子项数量
    if (section == 0) {
        return array1.count;
    }else{
        return array2.count;
    }
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
    if (indexPath.section == 0) {
        cell.textLabel.text = [array1 objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [array2 objectAtIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
//通过 segue跳转的 回调方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShellTool"]) {
        UIViewController *viewController = (UIViewController *)segue.destinationViewController;
//        secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 209, 110)];
//        secondView.layer.borderWidth = 1;
//        secondView.layer.borderColor = [[UIColor blueColor] CGColor];
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
        textView.text = @"SSH:ipad@10.10.152.18";
        textView.font = [UIFont boldSystemFontOfSize:18];
        textView.layer.borderWidth = 1;
        textView.layer.borderColor = [[UIColor blueColor] CGColor];
        [viewController.view addSubview:textView];
    }
    else if ([segue.identifier isEqualToString:@"Telnet"]) {
        UIViewController *viewController = (UIViewController *)segue.destinationViewController;
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
        textView.text = @"telnet 61.152.158.132 23";
        textView.font = [UIFont boldSystemFontOfSize:18];
        textView.layer.borderWidth = 1;
        textView.layer.borderColor = [[UIColor blueColor] CGColor];
        [viewController.view addSubview:textView];
    }
    else if ([segue.identifier isEqualToString:@"Feedback"]) {
        UIViewController *viewController = (UIViewController *)segue.destinationViewController;
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
        textView.text = @"反馈意见";
        textView.font = [UIFont boldSystemFontOfSize:18];
        textView.layer.borderWidth = 1;
        textView.layer.borderColor = [[UIColor blueColor] CGColor];
        [viewController.view addSubview:textView];
    }
    
//    if ([segue.identifier isEqualToString:@"TableCellToDetil"])
//    {
//        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
//        NSInteger row = path.row;
//        if (path.section == 0) {
//            NSString *title = [NSString stringWithFormat:@"第%d组, %@",path.section+1,
//                               [array1 objectAtIndex:row]];
//            [segue.destinationViewController showTitle:title];
//        }else{
//            NSString *title = [NSString stringWithFormat:@"第%d组, %@",path.section+1,
//                               [array2 objectAtIndex:row]];
//            [segue.destinationViewController showTitle:title];
//        }
//    }
}


@end
