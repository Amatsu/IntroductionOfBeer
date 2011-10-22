//
//  HomeViewController.h
//  BelgianBeer
//
//  Created by Amatsu on 11/10/09.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AleInfoDbAccessController.h"

@interface HomeViewController : UIViewController{
    AleInfoDbAccessController *aleInfoDbCtrl;        
}

@property (assign) AleInfoDbAccessController *aleInfoDbCtrl;

-(IBAction)showDeveInfo:(id)sender;

//StyleSort
-(IBAction)showAlelistStyleSort:(id)sender;


//AtoZSort
-(IBAction)showAleListAtoZSort:(id)sender;

@end
