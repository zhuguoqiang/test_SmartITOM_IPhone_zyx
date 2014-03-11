//
//  NewsViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-10.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "NewsViewController.h"
//#import "NewsTableViewCell.h"
//#import "LineChartView.h"
//#import "HostViewController.h"
//#import "AlarmViewController.h"

@interface NewsViewController ()
{
//    NSMutableArray *views;
//    NSMutableArray *newsTime;
//    NSMutableArray *newsName;
    NSString *newsTime;
    NSString *newsName;
//    NSMutableArray *secondViewControllers;
//
//    UIView *secondView;
//    UIView *thirdView;
}

@property (strong,nonatomic) NSMutableArray *views;


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
    
//    newsTime = [[NSMutableArray alloc] initWithObjects:@"9:12",@"8:30",@"7:00", nil];
//    newsName = [[NSMutableArray alloc] initWithObjects:@"host_dhcc",@"alarm_flows",@"msg_itsm", nil];
    newsName = @"host_dhcc";
    newsTime = @"9:28";
    
    self.views = [NSMutableArray arrayWithCapacity:20];
    
    _eLineChartScale = 1;
    
    /** Generate data for _eLineChart*/
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
    
    [self.views addObject:_eLineChart];

//    secondViewControllers = [[NSMutableArray alloc] init];
//
//    views = [[NSMutableArray alloc] init];
//    times = [[NSMutableArray alloc] initWithObjects:@"9:12",@"8:30",@"7:00", nil];
//    enterpriseNames = [[NSMutableArray alloc] initWithObjects:@"host_dhcc",@"alarm_flows",@"msg_itsm", nil];
//    
//    //建立第一个UIView
//    LineChartView *lineChartView = [[LineChartView alloc]initWithFrame:CGRectMake(0, 0,471, 480)];
    
    
//    NSMutableArray *pointArr = [[NSMutableArray alloc]init];
//    
//    //生成随机点
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*0, 0)]];
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*1, 40)]];
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*2, 70)]];
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*3, 30)]];
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*4, 20)]];
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*5, 55)]];
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*6, 80)]];
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*7, 100)]];
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*8, 43)]];
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*9, 59)]];
//    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*10, 23)]];
//    
//    //竖轴
//    NSMutableArray *vArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
//    for (int i=0; i<9; i++) {
//        [vArr addObject:[NSString stringWithFormat:@"%d",i*20]];
//    }
//    
//    //横轴
//    NSMutableArray *hArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
//    
//    [hArr addObject:@"05-26"];
//    [hArr addObject:@"05-27"];
//    [hArr addObject:@"05-28"];
//    [hArr addObject:@"05-29"];
//    [hArr addObject:@"05-30"];
//    [hArr addObject:@"06-01"];
//    [hArr addObject:@"06-02"];
//    [hArr addObject:@"06-03"];
//    [hArr addObject:@"06-04"];
//    [hArr addObject:@"06-05"];
//    
//    
//    [lineChartView setHDesc:hArr];
//    [lineChartView setVDesc:vArr];
//    [lineChartView setArray:pointArr];
//    
//    [views addObject:lineChartView];
//    
//    //建立第二个UIView
//    secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 200)];
//    UILabel *fLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 100)];
//    fLabel.text = @"Flowserve";
//    fLabel.textColor = [UIColor redColor];
//    fLabel.font = [UIFont fontWithName:nil size:60];
//    UILabel *ffLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 400, 100)];
//    ffLabel.text = @"内存利用率阀值越界";
//    ffLabel.font = [UIFont fontWithName:nil size:40];
//    
//    [secondView addSubview:fLabel];
//    [secondView addSubview:ffLabel];
//    
//    [views addObject:secondView];
//    
//    //第三个UIView
//    thirdView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 200)];
//    UILabel *sLabel = [[UILabel alloc] initWithFrame:thirdView.frame];
//    sLabel.text = @"故障通知";
//    sLabel.textColor = [UIColor redColor];
//    sLabel.font = [UIFont fontWithName:nil size:60];    [thirdView addSubview:sLabel];
//    
//    [views addObject:thirdView];
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsCell";
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
//    cell.newsName.text = [newsName objectAtIndex:indexPath.row];
//    cell.newsTime.text = [newsTime objectAtIndex:indexPath.row];
    cell.newsNames.text = [NSString stringWithFormat:@"%@",newsName];
    cell.newsTimes.text = [NSString stringWithFormat:@"%@",newsTime];

//    [cell.chartView addSubview:[views objectAtIndex:indexPath.row]];
//    [cell.imageView setImage:[UIImage imageNamed:@"user@2x.png"]];
    
    // Configure the cell...
    UIView *newView = [self.views objectAtIndex:indexPath.row];
    
    [cell.view addSubview:newView];
    
    return cell;
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"host"])
    {
        UIViewController *viewController = segue.destinationViewController;
        HostViewController *hostViewController = (HostViewController *)viewController;
        hostViewController.ipLabelText = @"192.168.0.1";
        hostViewController.categoryLabelText = @"主机";
        hostViewController.manufactotyLabelText = @"华为";
        hostViewController.informationView = [views objectAtIndex:0];
    }
    else if ([segue.identifier isEqualToString: @"alarm"])
    {
        UIViewController *viewController = segue.destinationViewController;
        AlarmViewController *alarmViewController = (AlarmViewController *)viewController;
        alarmViewController.IPLabelText = @"192.168.0.2";
        alarmViewController.categoryLabelText = @"服务器";
        alarmViewController.manufactoryLabeltext = @"IBM";
    }

}

*/

@end
