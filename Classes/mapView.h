//
//  mapView.h
//  tempemaps
//
//  Created by dthirum1 on 11/18/10.
//  Copyright 2010 edu.asu.cronkite. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface mapView : UIViewController {

	IBOutlet UIWebView *webView;
	IBOutlet UIButton *list;
	//IBOutlet MKMapView *mapView;
	IBOutlet UIButton *locationBarItem;
	IBOutlet UIBarButtonItem *locationBarButton;
	IBOutlet UIBarButtonItem *homePage;
	
	//CLLocationManager *locationManager;
	
	
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIButton *list;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *homePage;
//@property (nonatomic,retain) CLLocationManager *locationManager;
-(IBAction)currentLocation:(id)sender;
-(IBAction)listBuildings:(id)sender;
-(IBAction)backMapView;
-(IBAction)homePageView:(id)sender;



@end
