//
//  samplemapViewController.h
//  samplemap
//
//  Created by NMIL Admin on 8/31/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface samplemapViewController : UIViewController {
IBOutlet UIWebView *webView;
	IBOutlet UIButton *list;
//IBOutlet MKMapView *mapView;
IBOutlet UIButton *locationBarItem;
	IBOutlet UIBarButtonItem *locationBarButton;
	
//CLLocationManager *locationManager;
	
	
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIButton *list;
//@property (nonatomic,retain) CLLocationManager *locationManager;
-(IBAction)currentLocation:(id)sender;
-(IBAction)listBuildings:(id)sender;
-(IBAction)backMapView:(id)sender;

@end

