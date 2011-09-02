//
//  IntroductionOfBeerAppDelegate.h
//  IntroductionOfBeer
//
//  Created by 秀典 細野 on 11/09/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//  update by asaake
//

#import <UIKit/UIKit.h>

@interface IntroductionOfBeerAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
