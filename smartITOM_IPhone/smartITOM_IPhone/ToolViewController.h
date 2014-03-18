//
//  ToolViewController.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-7.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(copy,nonatomic)   NSMutableArray *keys;
@property(copy,nonatomic)   NSMutableDictionary *dataSource;
@property(retain,nonatomic) UITableView*myTableView;
@end
