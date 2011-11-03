//
//  Info.h
//  Freifunk MS
//
//  Created by Florian Seichter on 14.10.11.
//  Copyright (c) 2011 Firma Froschwelle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Info : UIViewController {
    
    IBOutlet UIScrollView *ScrollView;
    IBOutlet UIScrollView *ScrollViewNews;
    NSArray *list;
    
    IBOutlet UIWebView *news;
    IBOutlet UIActivityIndicatorView *activity;
	NSTimer *timer;
    
    
}

- (IBAction)link;
- (IBAction)link2;
- (IBAction)link3;
- (IBAction)link4;



-(IBAction)backButton:(id)sender;

@property (nonatomic, retain) IBOutlet UIWebView *news;
@property (nonatomic, retain) UIActivityIndicatorView *activity;



@end
