
ScreenCapture
=========

## ScreenCapture in Objective C and Swift 5.
------------
 Added Some screens here.
 
![](https://github.com/pawankv89/ScreenCapture/blob/master/Screens/1.png)
![](https://github.com/pawankv89/ScreenCapture/blob/master/Screens/2.png)
![](https://github.com/pawankv89/ScreenCapture/blob/master/Screens/screen_1.png)
![](https://github.com/pawankv89/ScreenCapture/blob/master/Screens/screen_2.png)
![](https://github.com/pawankv89/ScreenCapture/blob/master/Screens/screen_3.png)
![](https://github.com/pawankv89/ScreenCapture/blob/master/Screens/screen_4.png)

## Usage
------------
 iOS 9 Demo showing how to droodown on iPhone X Simulator in  Objective-C and Swift 5.


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
##  How to take a screenshot programmatically in iPhone/iOS?

Though iOS does not provide any official way to take screenshots on iOS device programmatically, it provides a way to screenshot using the home and power button, by pressing both of them at the same time.

To take a screenshot, we’ll have to go through a series of steps.

We’ll get the layer of keyWindow – UIApplication.shared.keyWindow!.layer

We’ll get the scale of screen – UIApplication.main.scale

Creating a new image with same size as the view.

Render and save the image.

Let’s create a new project, in the main view controller give some background color and then drag a button and connect to create an action to its class. Add the following code in the action.

While using this for the first time you’ll have to allow photos permission to save the image. The saved image will be in .jpg format.

Also add a “NSPhotoLibraryAddUsageDescription” to the info.plist of your app.

This can be converted to a function and used at multiple places, or as an extension.

This is how the app looks. When you run it.


```swiift

import UIKit

class ViewController: UIViewController {

override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view.
}

@IBAction func takeshot(_ sender: UIButton) {
var image :UIImage?
let currentLayer = UIApplication.shared.keyWindow!.layer
let currentScale = UIScreen.main.scale
UIGraphicsBeginImageContextWithOptions(currentLayer.frame.size, false, currentScale);
guard let currentContext = UIGraphicsGetCurrentContext() else {return}
currentLayer.render(in: currentContext)
image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
guard let img = image else { return }
UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
}
}


```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
