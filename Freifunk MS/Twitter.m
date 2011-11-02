//
//  Twitter.m
//  Freifunk MS
//
//  Created by Florian Seichter on 10.10.11.
//  Copyright (c) 2011 Firma Froschwelle. All rights reserved.
//

#import "Twitter.h"

@implementation Twitter
@synthesize news;
@synthesize activity;



-(void)webView:(UIWebView *)news didFailLoadWithError:(NSError *)error {
    
    UIAlertView *someError = [UIAlertView alloc];
    [someError initWithTitle: @"Fehler" message: @"Es besteht keine Verbindung mit dem Internet, bitte überprüfen sie ihre Einstellungen!"
                    delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [someError show];
    [someError release];
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        [news loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.twitter.com/#!/freifunk_ms"]]];
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        [news loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.twitter.com/#!/freifunk_ms"]]];
    }
    
    /*[news loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://froschwelle.dyndns.org:8080/abmeldung"]]];*/
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



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
