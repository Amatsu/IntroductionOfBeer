//
//  IntroductionOfBeerAppDelegate.h
//  IntroductionOfBeer
//
//  Created by Amatsu on 11/09/02.
//  Copyright 2011�N __MyCompanyName__. All rights reserved.
//  update by �e�X�g���{��
//

#import <UIKit/UIKit.h>

@interface IntroductionOfBeerAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
