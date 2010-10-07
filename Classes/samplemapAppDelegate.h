//
//  samplemapAppDelegate.h
//  samplemap
//
//  Created by NMIL Admin on 8/31/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class samplemapViewController;

@interface samplemapAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate> {
    UIWindow *window;
    samplemapViewController *viewController;
	//CLLocationManager *locationManager;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
//@property (nonatomic,retain) CLLocationManager *locationManager;
@property (nonatomic, retain) IBOutlet samplemapViewController *viewController;

@end

