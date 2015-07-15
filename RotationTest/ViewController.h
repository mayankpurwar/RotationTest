//
//  ViewController.h
//  VideoSizer
//
//  Created by Apple on 7/3/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import "MoreViewController.h"






//@class RBVolumeButtons;











@interface ViewController : UIViewController
{
    
CGFloat rotateValue;
    
        int deviceWidth,deviceHeight;
    
    IBOutlet UIView *topView;

}


- (void)orientationChanged:(NSNotification *)notification;


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end

