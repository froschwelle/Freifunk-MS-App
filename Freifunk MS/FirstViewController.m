//
//  FirstViewController.m
//  Freifunk MS
//
//  Created by Florian Seichter on 09.10.11.
//  Copyright (c) 2011 Firma Froschwelle. All rights reserved.
//

#import "FirstViewController.h"
#import "Info.h"
#import "map.h"

@implementation FirstViewController





- (IBAction)profil; {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://tinyurl.com/43l4s2p"]];
    
}


-(IBAction)infoButton:(id)sender; {
    Info *second = [[Info alloc] initWithNibName:nil bundle:nil];
	
	second.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:second animated:YES];
	
	[second release];

    
}

-(IBAction)mapButton:(id)sender; {
    map *second = [[map alloc] initWithNibName:nil bundle:nil];
	
	second.modalPresentationStyle = UIModalPresentationCurrentContext;
	[self presentModalViewController:second animated:YES];
	
	[second release];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown) &&
        (interfaceOrientation != UIInterfaceOrientationLandscapeLeft) &&
        (interfaceOrientation != UIInterfaceOrientationLandscapeRight);
    } else {
        return YES;
    }
}

@end
