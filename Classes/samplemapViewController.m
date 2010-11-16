//
//  samplemapViewController.m
//  samplemap
//
//  Created by NMIL Admin on 8/31/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "samplemapViewController.h"
#import "listAll.h"

@implementation samplemapViewController
@synthesize webView;
@synthesize list;

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
 NSString *url = @"http://cronkite-asu.github.com/maps3.html";
 NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
 [webView loadRequest:request];
 [super viewDidLoad];}

-(IBAction)listBuildings:(id)sender
{
	listAll *viewcontroller = [[listAll alloc] initWithNibName:@"listAll" bundle:[NSBundle mainBundle]];	
	[[self view] addSubview:viewcontroller.view];
	
	//[samplemapViewController logWindow :viewcontroller animated:YES];
}

-(IBAction)backMapView:(id)sender
{
	NSString *url = @"http://cronkite-asu.github.com/maps3.html";
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	[webView loadRequest:request];
	
	//[samplemapViewController logWindow :viewcontroller animated:YES];
}

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




@end
