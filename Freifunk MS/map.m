//
//  map.m
//  Freifunk MS
//
//  Created by Florian Seichter on 14.10.11.
//  Copyright (c) 2011 Firma Froschwelle. All rights reserved.
//

#import "map.h"
#import "SecondViewController.h"

@implementation map
@synthesize news;
@synthesize activity;



-(IBAction)mapButton:(id)sender; {
    SecondViewController *second = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
	
	second.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:second animated:YES];
	
	[second release];
    
}


-(void)webView:(UIWebView *)news didFailLoadWithError:(NSError *)error {
    
    UIAlertView *someError = [[UIAlertView alloc]initWithTitle: @"Fehler" message: @"Die Map konnte nicht geladen werden, da keine Verbindung zum Server hergestellt werden konnte!"
                    delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [someError show];
    [someError release];
    
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [news loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://maps.google.com/maps/ms?ie=UTF&msa=0&msid=215412755890010995247.00049040580365acf675c"]]];
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    
    news.opaque = NO;
	news.backgroundColor = [UIColor clearColor];
    
    
    
}


-(void)tick {
    if(!news.loading)
        [activity stopAnimating];
	else 
        [activity startAnimating];
    
}




- (IBAction)backButtonPressed:(id)sender;
{
	[self dismissModalViewControllerAnimated:YES];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
