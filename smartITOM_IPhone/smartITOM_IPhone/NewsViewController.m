//
//  NewsViewController.m
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-10.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "NewsViewController.h"
#import <sqlite3.h>
#define DATABASE_FILE @"SmartITOM.db"

@interface NewsViewController ()
{
    NSMutableArray *newsName;
    NSMutableArray *newsTime;
    NSMutableArray *newsImage;
    UIView *secondView;
    UIView *thirdView;
    sqlite3 *newsDB;
    NSString *databasePath;
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
    //self.views = [NSMutableArray arrayWithCapacity:10];
    self.views = [[NSMutableArray alloc] init];
    
    newsName = [[NSMutableArray alloc] init];
    newsTime = [[NSMutableArray alloc] init];
    newsImage = [[NSMutableArray alloc] init];

    //从数据库中select数组newsName、newsTime、newsImage的值
    NSArray *dirPaths;
    NSString *docsDir;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
//    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"SmartITOM.db"]];
    databasePath = [docsDir stringByAppendingPathComponent:DATABASE_FILE];
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbpath, &newsDB) == SQLITE_OK)
    {
        for (int i = 1; i <= 3; i++) {
            NSString *querySQL = [NSString stringWithFormat:@"select news_name, news_time, news_image from tb_news WHERE id = '%d'",i];
            const char *query_stmt = [querySQL UTF8String];
            if (sqlite3_prepare_v2(newsDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
            {
                if (sqlite3_step(statement) == SQLITE_ROW)
                {
                    [newsName addObject:[[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)]];
                    [newsTime addObject:[[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)]];
                    [newsImage addObject:[[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)]];
                }
                else
                {
                    UIAlertView *alertLogin = [[UIAlertView alloc]initWithTitle:@"消息提示"
                                                                        message:@"news查询错误！"
                                                                       delegate:self
                                                              cancelButtonTitle:@"取消"
                                                              otherButtonTitles:@"确定",nil];
                    [alertLogin show];
                }
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(newsDB);
    }
    //第一个UIView _eLineChart---------------------------------------------------
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0 ; i < 300; i++)
    {
        int number = arc4random() % 100;
        ELineChartDataModel *eLineChartDataModel = [[ELineChartDataModel alloc] initWithLabel:[NSString stringWithFormat:@"%d", i] value:number index:i unit:@"kWh"];
        [tempArray addObject:eLineChartDataModel];
    }
    _eLineChartData = [NSArray arrayWithArray:tempArray];
    _eLineChart = [[ELineChart alloc] initWithFrame:CGRectMake(0, 30, CGRectGetWidth(self.view.frame), 107)];

    [_eLineChart setDelegate:self];
    [_eLineChart setDataSource:self];
    [self.views addObject:_eLineChart];

    //第二个UIView---------------------------------------------------------------
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

//为cell设置名称、时间、图标
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsCell";
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.newsNames.text = [newsName objectAtIndex:indexPath.row];
    cell.newsTimes.text = [newsTime objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[newsImage objectAtIndex:indexPath.row] ofType:@"png"];
        [cell.newsImages setImage:[UIImage imageWithContentsOfFile:path]];
    }else if (indexPath.row == 1) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[newsImage objectAtIndex:indexPath.row] ofType:@"png"];
        [cell.newsImages setImage:[UIImage imageWithContentsOfFile:path]];
    }else if (indexPath.row == 2) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[newsImage objectAtIndex:indexPath.row] ofType:@"png"];
        [cell.newsImages setImage:[UIImage imageWithContentsOfFile:path]];
    }

    UIView *newView = [self.views objectAtIndex:indexPath.row];
    [cell.view addSubview:newView];
    
    return cell;
}

//选择跳转的controller
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

//为host、alarm传递参数
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


@end
