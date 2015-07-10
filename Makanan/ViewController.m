//
//  ViewController.m
//  Makanan
//
//  Created by Didats on 10/07/15.
//  Copyright (c) 2015 Rimbunesia. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () {
    NSArray *arrData;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    arrData = @[
                @{@"section": @"Manis",
                  @"item": @[
                          @{@"image": [UIImage imageNamed:@"kolak"],
                            @"title": @"Kolak",
                            @"desc": @"Makanan khas puasa",
                            @"detail": @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"}
                          ]},
                @{@"section": @"Kolesterol",
                  @"item": @[
                          @{@"image": [UIImage imageNamed:@"Bitmap"],
                            @"title": @"Sate Ayam",
                            @"desc": @"Makanan enak",
                            @"detail": @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"}
                          ]}
                ];
    
    [self.tableView reloadData];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 28;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 269;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [arrData count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[arrData objectAtIndex:section] objectForKey:@"item"] count];
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 28)];
    [headerView setBackgroundColor:[UIColor colorWithRed:0.204f green:0.286f blue:0.369f alpha:1.00f]];
    //[headerView setBackgroundColor:[UIColor blackColor]];
    
    NSDictionary *item = [arrData objectAtIndex:section];
    
    UILabel *labelSection = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, headerView.frame.size.width - 10, 28)];
    [labelSection setTextAlignment:NSTextAlignmentRight];
    [labelSection setTextColor:[UIColor whiteColor]];
    [labelSection setText:item[@"section"]];
    [headerView addSubview:labelSection];
    
    
    return headerView;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"MakananCell" owner:self options:nil];
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell = self.tableCell;
    }
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:1];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    UILabel *desc = (UILabel *)[cell viewWithTag:3];
    
    NSDictionary *item = [[[arrData objectAtIndex:indexPath.section] objectForKey:@"item"] objectAtIndex:indexPath.row];
    
    [image setImage:[item objectForKey:@"image"]];
    [title setText:item[@"title"]];
    [desc setText:item[@"desc"]];
    
    return cell;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *item = [[[arrData objectAtIndex:indexPath.section] objectForKey:@"item"] objectAtIndex:indexPath.row];
    DetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    [detailView setDetailItem:item];
    
    [self.navigationController pushViewController:detailView animated:YES];
}


@end
