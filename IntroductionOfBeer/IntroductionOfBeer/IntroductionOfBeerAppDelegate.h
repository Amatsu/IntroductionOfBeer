//
//  IntroductionOfBeerAppDelegate.h
//  IntroductionOfBeer
//
//  Created by Amatsu on 11/09/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//  update by asaake2
//

#import <UIKit/UIKit.h>

@interface IntroductionOfBeerAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
