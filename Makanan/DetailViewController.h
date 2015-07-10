//
//  DetailViewController.h
//  Makanan
//
//  Created by Didats on 10/07/15.
//  Copyright (c) 2015 Rimbunesia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UIImageView *imageItem;
@property (weak, nonatomic) IBOutlet UILabel *labelDetail;



- (IBAction)buttonClicked:(id)sender;

@end
