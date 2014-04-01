//
//  AddEquipmentViewController.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-25.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol insertObject <NSObject>

-(void)setValue:(NSString *)object;

@end

@interface AddEquipmentViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>
@property (assign,nonatomic) id <insertObject> delegate;
@end
