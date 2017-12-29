//
//  ViewController.m
//  Screen Capture
//
//  Created by Pawan kumar on 12/10/17.
//  Copyright © 2017 Pawan Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)screenCaptureTap:(id)sender{
    
    //create graphics context with screen size
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIGraphicsBeginImageContext(screenRect.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    CGContextFillRect(ctx, screenRect);
    
    // grab reference to our window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // transfer content into our context
    [window.layer renderInContext:ctx];
    UIImage *screengrab = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // save screenshot to Camera Roll
    UIImageWriteToSavedPhotosAlbum(screengrab, nil, nil, nil);
}

@end
