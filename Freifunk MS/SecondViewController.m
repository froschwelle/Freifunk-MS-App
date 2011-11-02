//
//  SecondViewController.m
//  Freifunk MS
//
//  Created by Florian Seichter on 09.10.11.
//  Copyright (c) 2011 Firma Froschwelle. All rights reserved.
//

#import "SecondViewController.h"
#import "SBJson.h"
#import "map.h"

#define ROW_HEIGHT 50

@implementation SecondViewController

- (IBAction)backButton:(id)sender;
{
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)mapButton:(id)sender; {
    map *second = [[map alloc] initWithNibName:nil bundle:nil];
	
	second.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:second animated:YES];
	
	[second release];
    
}


#pragma mark -
#pragma mark View lifecycle





- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *myRawJson = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://froschwelle.de/freifunk/adressen.php"] encoding:NSUTF8StringEncoding error:nil];
    
    if ([myRawJson length] == 0) {
        [myRawJson release];
        return;
        
        
        
        
        
    }
	
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    list = [[parser objectWithString:myRawJson error:nil] copy];
    
    [parser release];
    
    
    self.tableView.rowHeight = ROW_HEIGHT;
    
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [list count];
	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	    
    cell.textLabel.text = [list objectAtIndex:indexPath.row];
    
    
    
    return cell;

    
}






- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    
    cell.textLabel.text = [list objectAtIndex:indexPath.row];
    
    
    UIAlertView *fullLine = [UIAlertView alloc];
    [fullLine initWithTitle: @"Verfügbarkeit" message: cell.textLabel.text = [list objectAtIndex:indexPath.row]
                    delegate:self cancelButtonTitle:@"close" otherButtonTitles: nil];
    [fullLine show];
    [fullLine release];
    
    
    
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */



 // Override to support editing the table view.
/*
 - (void)tableView:(UITableViewCell *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:ce] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }*/



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


#pragma mark -
#pragma mark Table view delegate






- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
