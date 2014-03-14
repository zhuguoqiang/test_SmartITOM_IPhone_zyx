//
//  NewsViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-10.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "NewsViewController.h"


@interface NewsViewController ()
{
    NSMutableArray *newsName;
    NSMutableArray *newsTime;
//    NSString *newsName;
//    NSString *newsTime;

    UIView *secondView;
    UIView *thirdView;
}

@end

@implementation NewsViewController
@synthesize eLineChart = _eLineChart;
@synthesize eLineChartData = _eLineChartData;
@synthesize eLineChartScale = _eLineChartScale;
@synthesize views;

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
    self.clearsSelectionOnViewWillAppear = YES;
    //初始化数组，为可变数组指定初始容量
//    self.views = [NSMutableArray arrayWithCapacity:10];
    self.views = [[NSMutableArray alloc] init];
    newsName = [[NSMutableArray alloc] initWithObjects:@"host_dhcc",@"alarm_flows",@"msg_itsm", nil];
    newsTime = [[NSMutableArray alloc] initWithObjects:@"9:12",@"8:30",@"7:00", nil];
    
//    _eLineChartScale = 1;
    
    //第一个UIView _eLineChart---------------------------------------------------
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0 ; i < 300; i++)
    {
        int number = arc4random() % 100;
        ELineChartDataModel *eLineChartDataModel = [[ELineChartDataModel alloc] initWithLabel:[NSString stringWithFormat:@"%d", i] value:number index:i unit:@"kWh"];
        [tempArray addObject:eLineChartDataModel];
    }
    _eLineChartData = [NSArray arrayWithArray:tempArray];
    /** The Actual frame for the line is half height of the frame you specified, because the bottom half is for the touch control, but it's empty */
    _eLineChart = [[ELineChart alloc] initWithFrame:CGRectMake(0, 30, CGRectGetWidth(self.view.frame), 107)];
    [_eLineChart setDelegate:self];
    [_eLineChart setDataSource:self];
//    [_eLineChart setNeedsDisplay];
    
    [self.views addObject:_eLineChart];
//    [yourViewController.view setNeedsDisplay]

    //第二个UIView---------------------------------------------------------------
    //CGRectMake(x, y, width, height)
    secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 209, 110)];
    secondView.layer.borderWidth = 1;
    secondView.layer.borderColor = [[UIColor blueColor] CGColor];
    UILabel *fLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 200, 50)];
    fLabel.text = @"Flowserve";
    fLabel.textColor = [UIColor redColor];
    fLabel.font = [UIFont fontWithName:nil size:50];
    UILabel *ffLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 200, 50)];
    ffLabel.text = @"内存利用率阀值越界";
    ffLabel.font = [UIFont fontWithName:nil size:40];
    
    [secondView addSubview:fLabel];
    [secondView addSubview:ffLabel];
    
    [self.views addObject:secondView];

    //第三个UIView---------------------------------------------------------------
    thirdView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 209, 110)];
    thirdView.layer.borderWidth = 1;
    thirdView.layer.borderColor = [[UIColor blueColor] CGColor];
//    UILabel *sLabel = [[UILabel alloc] initWithFrame:thirdView.frame];
    UILabel *sLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 200, 50)];
    sLabel.text = @"故障通知";
    sLabel.textColor = [UIColor redColor];
    sLabel.font = [UIFont fontWithName:nil size:50];
    
    [thirdView addSubview:sLabel];
    [self.views addObject:thirdView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return views.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsCell";
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.newsNames.text = [newsName objectAtIndex:indexPath.row];
    cell.newsTimes.text = [newsTime objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"host" ofType:@"png"];
        [cell.newsImages setImage:[UIImage imageWithContentsOfFile:path]];
    }else if (indexPath.row == 1) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"alarm" ofType:@"png"];
        [cell.newsImages setImage:[UIImage imageWithContentsOfFile:path]];
    }else {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"msg" ofType:@"png"];
        [cell.newsImages setImage:[UIImage imageWithContentsOfFile:path]];
    }
    
    // Configure the cell...
    UIView *newView = [self.views objectAtIndex:indexPath.row];
    [cell.view addSubview:newView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
        
        [self performSegueWithIdentifier:@"host" sender:self];
    
    else if(indexPath.row == 1)
        
        [self performSegueWithIdentifier:@"alarm" sender:self];
    
    else
        
        [self performSegueWithIdentifier:@"msg" sender:self];
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"host"])
    {
        UIViewController *viewController = segue.destinationViewController;
        HostTableViewController *hostTableViewController = (HostTableViewController *)viewController;
        hostTableViewController.IPLabelText = @"192.168.0.1";
        hostTableViewController.categoryLabelText = @"主机";
        hostTableViewController.manufactoryLabelText = @"华为";
//        hostTableViewController.informationView = [views objectAtIndex:0];
    }
    else if ([segue.identifier isEqualToString: @"alarm"])
    {
        UIViewController *viewController = segue.destinationViewController;
        AlarmViewController *alarmViewController = (AlarmViewController *)viewController;
        alarmViewController.IPLabelText = @"192.168.0.2";
        alarmViewController.categoryLabelText = @"服务器";
        alarmViewController.manufactoryLabelText = @"IBM";
//        alarmViewController.informationView = [views objectAtIndex:1];
    }
    
}


#pragma -mark- ELineChart DataSource
- (NSInteger) numberOfPointsInELineChart:(ELineChart *) eLineChart
{
    return [_eLineChartData count];
}

- (NSInteger) numberOfPointsPresentedEveryTime:(ELineChart *) eLineChart
{
    //    NSInteger num = 20 * (1.0 / _eLineChartScale);
    //    NSLog(@"%d", num);
    return 30;
}

- (ELineChartDataModel *)     highestValueELineChart:(ELineChart *) eLineChart
{
    ELineChartDataModel *maxDataModel = nil;
    float maxValue = -FLT_MIN;
    for (ELineChartDataModel *dataModel in _eLineChartData)
    {
        if (dataModel.value > maxValue)
        {
            maxValue = dataModel.value;
            maxDataModel = dataModel;
        }
    }
    return maxDataModel;
}

- (ELineChartDataModel *)eLineChart:(ELineChart *)eLineChart
                      valueForIndex:(NSInteger)index
{
    if (index >= [_eLineChartData count] || index < 0) return nil;
    return [_eLineChartData objectAtIndex:index];
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



@end
