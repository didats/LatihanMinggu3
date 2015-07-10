//
//  ViewController.h
//  Makanan
//
//  Created by Didats on 10/07/15.
//  Copyright (c) 2015 Rimbunesia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITableViewCell *tableCell;

@end

