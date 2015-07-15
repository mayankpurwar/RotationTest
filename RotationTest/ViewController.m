//
//  ViewController.m
//  VideoSizer
//
//  Created by Apple on 7/3/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController








//********** VIEW DID LOAD **********
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    deviceWidth = self.view.frame.size.width;
    deviceHeight = self.view.frame.size.height;
    
    
    [self.view layoutIfNeeded];
    
    NSLog(@"didload");
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    
    
    //    [self setVolumeControl];
    
    
    
   
    
}





//********** VIEW WILL APPEAR **********
//View about to be added to the window (called each time it appears)
//Occurs after other view's viewWillDisappear
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"should auto1");
    return YES;
    return (interfaceOrientation == UIDeviceOrientationPortrait);
}

- (NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskPortrait;
}

- (void)orientationChanged:(NSNotification *)notification
{
    int x = 0;
    int y = 0;
    rotateValue = rotateValue+(-rotateValue);
    [self RotateObject:rotateValue withXpos:x withYpos:y];
    
    switch ([UIDevice currentDevice].orientation) {
        case UIDeviceOrientationPortrait:
            rotateValue += 0;
            break;
        case UIDeviceOrientationLandscapeLeft:
            rotateValue +=M_PI/2;
            NSLog(@"%@",NSStringFromCGRect(self.view.frame));
            x = deviceWidth-topView.frame.size.height;
            y = (deviceHeight-72-topView.frame.size.width)/2;
            break;
        case UIDeviceOrientationLandscapeRight:
            rotateValue +=(-M_PI/2);
            x = 0;
            y = (deviceHeight-72-topView.frame.size.width)/2;
            
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            break;
        default:
            break;
    }
    
    [self RotateObject:rotateValue withXpos:x withYpos:y];
}


-(void)RotateObject:(CGFloat)rotation withXpos:(int)x withYpos:(int)y
{
    if([[UIDevice currentDevice].systemVersion floatValue]<8.0)
        [topView setTranslatesAutoresizingMaskIntoConstraints:YES];
    topView.transform = CGAffineTransformMakeRotation(rotateValue);
    topView.frame = CGRectMake(x,y, topView.frame.size.width, topView.frame.size.height);
    
//    btnMoreInfo.transform = CGAffineTransformMakeRotation(rotateValue);
//    btnCameraRoll.transform = CGAffineTransformMakeRotation(rotateValue);
//    btnStartStop.transform = CGAffineTransformMakeRotation(rotateValue);
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (BOOL) shouldAutorotate
{
    return NO;
}

-(IBAction)Click_btnMore:(id)sender
{
    //    [self orientationChanged:nil];
    
    //    [self RotateObject:0 withXpos:0 withYpos:0];
    
    self.navigationController.navigationBar.hidden = NO;
    MoreViewController *more = [self.storyboard instantiateViewControllerWithIdentifier:@"MoreViewController"];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:more];
    [self presentViewController:nav animated:YES completion:nil];
}



//-(IBAction)ShowImagePicker:(id)sender
//{
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
//    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
//    imgPicker.delegate = self;
//    imgPicker.allowsEditing = YES;
//    imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    [self presentViewController:imgPicker animated:YES completion:NULL];
//}
//
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
//    [picker dismissViewControllerAnimated:YES completion:nil];
//}
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
//    [picker dismissViewControllerAnimated:YES completion:nil];
//}




@end
