//
//  Twitter.h
//  Freifunk MS
//
//  Created by Florian Seichter on 10.10.11.
//  Copyright (c) 2011 Firma Froschwelle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Twitter : UIViewController {
    
    IBOutlet UIWebView *news;
    IBOutlet UIActivityIndicatorView *activity;
	NSTimer *timer;
}

-(IBAction)backButtonPressed:(id)sender;

@property(nonatomic, retain) IBOutlet UIWebView *news;
@property (nonatomic, retain) UIActivityIndicatorView *activity;


@end
