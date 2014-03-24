//
//  SQLViewController.h
//  smartITOM_IPhone
//
//  Created by Apple Developer on 14-3-24.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQLViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *writeTextView;
@property (strong, nonatomic) IBOutlet UITextView *resultTextView;
- (IBAction)executeButton:(id)sender;
@end
