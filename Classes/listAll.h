//
//  listAll.h
//  tempeMaps
//
//  Created by dthirum1 on 9/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<sqlite3.h>


@interface listAll : UITableViewController {
	UITableView *myTableView;
	//NSMutableArray *dataSource;
	NSMutableArray *searchedNames;
	NSMutableArray *names;

}
@property (nonatomic,retain) IBOutlet UITableView *myTableView;

//@property(nonatomic,retain)NSMutableArray *dataSource;
-(void) loadNames;

@end
