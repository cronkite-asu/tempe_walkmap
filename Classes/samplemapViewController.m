//
//  samplemapViewController.m
//  samplemap
//
//  Created by NMIL Admin on 8/31/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "samplemapViewController.h"

@implementation samplemapViewController
@synthesize webView;

-(IBAction)currentLocation:(id)sender{
	
	
		NSString *jsCommand= [NSString stringWithFormat:@"toggleLocation();"];
	[self.webView stringByEvaluatingJavaScriptFromString:jsCommand];
	//}
	
	}
	

		/*
		-(void) locationManager:(CLLocationManager *)manager didUpdateLocation:(CLLocation *)newLocation fromLocation:(CLLocation *) didLocation{
			MKCoordinateSpan span;
			span.latitudeDelta=0.2;
			span.longitudeDelta=0.2;
			
			MKCoordinateRegion region;
			region.span=span;
			region.center= newLocation.coordinate;
			[mapView setRegion:region animated:YES];
			mapView.showsUserLocation= YES;
		}*/
    // Override point for customization after app launch    
    //[window addSubview:viewController.view];
    //[window makeKeyAndVisible];
	



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
 NSString *url = @"http://dhivyat.github.com";
 NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
 [webView loadRequest:request];
 [super viewDidLoad];}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}
#pragma mark CLLocationManagerDelegate Methods

/*-(void) locationManager:(CLLocationManager *)manager didUpdateLocation:(CLLocation *)newLocation fromLocation:(CLLocation *) didLocation{
	MKCoordinateSpan span;
	span.latitudeDelta=0.2;
	span.longitudeDelta=0.2;
	
	MKCoordinateRegion region;
	region.span=span;
	region.center= newLocation.coordinate;
	[mapView setRegion:region animated:YES];
	mapView.showsUserLocation= YES;
	
}*/

@end
