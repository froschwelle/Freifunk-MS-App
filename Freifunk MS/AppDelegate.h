//
//  AppDelegate.h
//  Freifunk MS
//
//  Created by Florian Seichter on 09.10.11.
//  Copyright (c) 2011 Firma Froschwelle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;




@end
