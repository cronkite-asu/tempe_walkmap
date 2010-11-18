//
//  mapView.m
//  tempemaps
//
//  Created by dthirum1 on 11/18/10.
//  Copyright 2010 edu.asu.cronkite. All rights reserved.
//

#import "mapView.h"
#import "listAll.h"
#import "samplemapViewController.h"


@implementation mapView

@synthesize webView;
@synthesize list;
@synthesize homePage;

-(IBAction)currentLocation:(id)sender{
	
	
	NSString *jsCommand= [NSString stringWithFormat:@"toggleLocation();"];
	[self.webView stringByEvaluatingJavaScriptFromString:jsCommand];
	
	
}



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
	[self backMapView];
	[super viewDidLoad];
}

-(IBAction)listBuildings:(id)sender
{
	listAll *viewcontroller = [[listAll alloc] initWithNibName:@"listAll" bundle:[NSBundle mainBundle]];	
	[[self view] addSubview:viewcontroller.view];
	
	//[samplemapViewController logWindow :viewcontroller animated:YES];
}
-(IBAction)homePageView:(id)sender
{
	samplemapViewController *viewcontroller = [[samplemapViewController alloc] initWithNibName:@"samplemapViewController" bundle:[NSBundle mainBundle]];	
	[[self view] addSubview:viewcontroller.view];
}

-(IBAction)backMapView
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"maps3" ofType:@"html"];
	NSString *mapsHTML = [NSString stringWithContentsOfFile: filePath encoding:NSUTF8StringEncoding error:nil];
	NSString *path = [[NSBundle mainBundle] bundlePath];
	NSURL *baseURL = [NSURL fileURLWithPath:path];
	[webView loadHTMLString:mapsHTML baseURL:baseURL];
	
	//[samplemapViewController logWindow :viewcontroller animated:YES];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
