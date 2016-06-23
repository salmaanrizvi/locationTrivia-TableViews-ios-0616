//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Salmaan Rizvi on 6/23/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()


@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.accessibilityLabel = self.tableView.accessibilityIdentifier = @"Locations Table";
    
    self.locations = [[NSArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.locations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"locationCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = ((FISLocation *)self.locations[indexPath.row]).name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", ((FISLocation *)self.locations[indexPath.row]).trivia.count];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FISTriviaTableViewController *triviaTVC = [self.storyboard instantiateViewControllerWithIdentifier:@"triviaView"];
    
    NSLog(@"Trivia Array: %@", ((FISLocation *)self.locations[indexPath.row]).trivia);
    
    triviaTVC.trivium = ((FISLocation *)self.locations[indexPath.row]).trivia;
    
    [self.navigationController pushViewController:triviaTVC animated:YES];
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
