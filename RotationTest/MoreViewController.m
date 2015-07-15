//
//  MoreViewController.m
//  VideoSizer
//
//  Created by Apple on 7/3/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked)];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -
#pragma mark UINavigationBarDelegate

-(void)backButtonClicked
{
//    ViewController *view = (ViewController *)self.presentingViewController;
//    [view SetCameraGridandPreset];
//    [view shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait];
//    [view supportedInterfaceOrientations];
//    [view orientationChanged:nil];
    
    
    
    self.presentedViewController.navigationController.navigationBar.hidden = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"should auto1");
    return (interfaceOrientation == !UIDeviceOrientationPortraitUpsideDown);
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;;
}

- (BOOL) shouldAutorotate {
    return YES;
}





@end
