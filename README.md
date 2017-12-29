
ScreenCapture
=========

## ScreenCapture.
------------
 Added Some screens here.
 
[![](https://github.com/pawankv89/ScreenCapture/blob/master/Screens/1.png)]
[![](https://github.com/pawankv89/ScreenCapture/blob/master/Screens/2.png)]

## Usage
------------
 iOS 9 Demo showing how to droodown on iPhone X Simulator in  Objective-C.


```objective-c

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


```

```objective-c

```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
