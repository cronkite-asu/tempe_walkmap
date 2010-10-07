//
//  samplemapAppDelegate.m
//  samplemap
//
//  Created by NMIL Admin on 8/31/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "samplemapAppDelegate.h"
#import "samplemapViewController.h"

@implementation samplemapAppDelegate

@synthesize window;
@synthesize viewController;
//@synthesize locationManager;


- (void)applicationDidFinishLaunching:(UIApplication *)application { 
	
    /*self.locationManager =[[[CLLocationManager alloc]init]autorelease];
	if(self.locationManager.locationServicesEnabled){
		self.locationManager.delegate=self;
		self.locationManager.distanceFilter=100;
		[self.locationManager startUpdatingLocation];*/
	
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
	//[locationManager release];
    [super dealloc];
}
	
/*#pragma mark CLLocationManagerDelegate Methods
	
	-(void) locationManager:(CLLocationManager *)manager didUpdateLocation:(CLLocation *)newLocation fromLocation:(CLLocation *) didLocation{
		MKCoordinateSpan span;
		span.latitudeDelta=0.2;
		span.longitudeDelta=0.2;
		
		MKCoordinateRegion region;
		region.span=span;
		region.center= newLocation.coordinate;
		[viewController.mapView setRegion:region animated:YES];
		viewController.mapView.showsUserLocation= YES;
		
	}*/

@end
