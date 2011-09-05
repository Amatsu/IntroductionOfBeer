//
//  SqliteSampleAppDelegate.h
//  SqliteSample
//
//  Created by Amatsu on 11/09/05.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SqliteSampleViewController;

@interface SqliteSampleAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SqliteSampleViewController *viewController;

@end
