//
//  HostTableViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-14.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "HostTableViewController.h"

@interface HostTableViewController ()
{
    UIView *informationView;
//    NSString *ipLabelText;
//    NSString *categoryLabelText;
//    NSString *manufactotyLabelText;

}
@end

@implementation HostTableViewController
@synthesize eLineChart = _eLineChart;
@synthesize eLineChartData = _eLineChartData;
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
    self.views = [NSMutableArray arrayWithCapacity:20];
//    ipLabelText = @"192.168.0.1";
//    categoryLabelText = @"dhcc";
//    manufactotyLabelText = @"MySql";
    
    /** Information Cell*/
    informationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 110)];
    UILabel *iLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 80, 40)];
    iLabel.text = @"IP：";
//    NSLog(@"%@",self.IPLabelText);
    UILabel *iiLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 200, 40)];
//    iiLabel.text = ipLabelText;
    iiLabel.text = self.IPLabelText;
    
    UILabel *cLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, 80, 40)];
    cLabel.text = @"类别：";
    UILabel *ccLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 200, 40)];
//    ccLabel.text = categoryLabelText;
    ccLabel.text = self.categoryLabelText;
    
    UILabel *mLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 80, 40)];
    mLabel.text = @"厂家：";
    UILabel *mmLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
//    mmLabel.text = manufactotyLabelText;
    mmLabel.text = self.manufactoryLabelText;
    
    [informationView addSubview:iLabel];
    [informationView addSubview:iiLabel];
    [informationView addSubview:cLabel];
    [informationView addSubview:ccLabel];
    [informationView addSubview:mLabel];
    [informationView addSubview:mmLabel];
    
    [self.views addObject:informationView];
    
    /** Echart Cell*/
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0 ; i < 300; i++)
    {
        int number = arc4random() % 100;
        ELineChartDataModel *eLineChartDataModel = [[ELineChartDataModel alloc] initWithLabel:[NSString stringWithFormat:@"%d", i] value:number index:i unit:@"kWh"];
        [tempArray addObject:eLineChartDataModel];
    }
    _eLineChartData = [NSArray arrayWithArray:tempArray];
    
    /** The Actual frame for the line is half height of the frame you specified, because the bottom half is for the touch control, but it's empty */
    _eLineChart = [[ELineChart alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 180)];
    _eLineChart.layer.borderColor = [[UIColor redColor] CGColor];
    _eLineChart.layer.borderWidth = 1;
    [_eLineChart setDelegate:self];
    [_eLineChart setDataSource:self];
    
    [self.views addObject:_eLineChart];
    
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
    static NSString *CellIdentifier = @"HostCell";
    HostCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
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
}

 */

@end
