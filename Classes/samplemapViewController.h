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

	IBOutlet UIButton *mainMapPage;
	
	
//IBOutlet MKMapView *mapView;

	
	
	
}

@property (nonatomic, retain) IBOutlet UIButton *mainMapPage;


-(IBAction)mainMapView:(id)sender;



@end

