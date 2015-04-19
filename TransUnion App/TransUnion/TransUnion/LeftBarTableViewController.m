//
//  LeftBarTableViewController.m
//  TransUnion
//
//  Created by Matt Goodrich on 4/17/15.
//  Copyright (c) 2015 Increditables. All rights reserved.
//

#import "LeftBarTableViewController.h"
#import "DashboardViewController.h"

@interface LeftBarTableViewController ()

@end

@implementation LeftBarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.scrollEnabled = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
}

- (void)viewDidAppear:(BOOL)animated {
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES  scrollPosition:UITableViewScrollPositionBottom];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIFont *IntroThinCaps = [UIFont fontWithName:@"IntroRegularCaps" size:14];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleBar" forIndexPath:indexPath];
    UILabel *titleBarLabel = (UILabel *)[cell viewWithTag:101];
    titleBarLabel.highlightedTextColor = [UIColor whiteColor];
    titleBarLabel.textColor = [UIColor colorWithRed:128.0/255.0 green:192.0/255.0 blue:208.0/255.0 alpha:1.0];
    titleBarLabel.font = IntroThinCaps;
    UIImageView *barIcon = (UIImageView *)[cell viewWithTag:102];
    
    if (indexPath.row == 0){
        titleBarLabel.text = @"Dashboard";
        UIImage *dashboardImage = [UIImage imageNamed:@"dashboard_icon_unselected"];
        [barIcon setHighlightedImage:[UIImage imageNamed:@"dashboard_icon"]];
        [barIcon setImage:dashboardImage];
    } else if (indexPath.row == 1){
        titleBarLabel.text = @"Statistics";
        UIImage *statisticsImage = [UIImage imageNamed:@"statistics_icon_unselected"];
        [barIcon setHighlightedImage:[UIImage imageNamed:@"statistics_icon"]];
        [barIcon setImage:statisticsImage];
    } else if (indexPath.row == 2){
        titleBarLabel.text = @"Alerts";
        UIImage *statisticsImage = [UIImage imageNamed:@"alerts_icon_unselected"];
        [barIcon setHighlightedImage:[UIImage imageNamed:@"alerts_icon"]];
        [barIcon setImage:statisticsImage];
    } else if (indexPath.row == 3){
        titleBarLabel.text = @"Identity Protection";
        UIImage *statisticsImage = [UIImage imageNamed:@"lock_icon_unselected"];
        [barIcon setHighlightedImage:[UIImage imageNamed:@"lock_icon"]];
        [barIcon setImage:statisticsImage];
    } else if (indexPath.row == 4){
        titleBarLabel.text = @"Profile";
        UIImage *statisticsImage = [UIImage imageNamed:@"profile_icon_unselected"];
        [barIcon setHighlightedImage:[UIImage imageNamed:@"profile_icon"]];
        [barIcon setImage:statisticsImage];
    }
    
    
    [cell setBackgroundColor:[UIColor colorWithRed:1/255.0 green:137/255.0 blue:171/255.0 alpha:1.0]];
    
    UIView *selectedBackgroundView = [[UIView alloc] init];
    selectedBackgroundView.backgroundColor = [UIColor colorWithRed:1/255.0 green:137/255.0 blue:171/255.0 alpha:1.0];
    cell.selectedBackgroundView = selectedBackgroundView;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
