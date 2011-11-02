//
//  Info.m
//  Freifunk MS
//
//  Created by Florian Seichter on 14.10.11.
//  Copyright (c) 2011 Firma Froschwelle. All rights reserved.
//

#import "Info.h"
#import "SBJson.h"
#import "map.h"


@implementation Info


//



- (IBAction)link; {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/alios"]];
    
}

- (IBAction)link2; {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/zeroskillor"]];
    
}

- (IBAction)link3; {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/froschwelle"]];
    
}

- (IBAction)link4; {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://froschwelle.de/apps"]];
    
}


//Freifunk MS News:

-(void)webView:(UIWebView *)news didFailLoadWithError:(NSError *)error {
    
    UIAlertView *someError = [UIAlertView alloc];
    [someError initWithTitle: @"Fehler" message: @"Es konnten keine Neuigkeiten geladen werden, da anscheinend keine Verbindung zum Server besteht!"
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



-(void)tick {
    if(!news.loading)
        [activity stopAnimating];
	else 
        [activity startAnimating];
    
}








- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ScrollView setScrollEnabled:YES];
    [ScrollView setContentSize:CGSizeMake(320, 1000)];
    
    [ScrollViewNews setScrollEnabled:YES];
    [ScrollViewNews setContentSize:CGSizeMake(320, 1000)];
    
    [news loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://froschwelle.de/freifunk/news.html"]]];
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    
    news.opaque = NO;
	news.backgroundColor = [UIColor clearColor];

    
        
    
}





-(IBAction)backButton:(id)sender; {
    
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


#pragma mark - View lifecycle



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
