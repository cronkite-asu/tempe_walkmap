//
//  listAll.m
//  tempeMaps
//
//  Created by dthirum1 on 9/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "listAll.h"
#import "sqlite3.h"


@implementation listAll
@synthesize myTableView;



#pragma mark -
#pragma mark View lifecycle





-(void)loadNames {
	// Path to the database
	NSString* dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"buildinglist.db"];
	NSLog(@"databasePath: %@",dbPath);
	sqlite3 *database;
	NSString *name;
	
	// Open the database
	if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		NSLog(@"database open");
		const char *sql = "SELECT buildingname FROM listAllBuildings";
		sqlite3_stmt *compiledStmt;
		// Fetch all names
		NSLog(@"fetch names");
		if (sqlite3_prepare_v2(database, sql, -1, &compiledStmt, NULL) == SQLITE_OK) {
			// Append each name
			NSLog(@"append names");
			while (sqlite3_step(compiledStmt) == SQLITE_ROW) {
				const char* cName = (char*)sqlite3_column_text(compiledStmt, 0);
				if (cName == NULL)
					// There should not be a NULL name
					NSLog(@"Null name!!");
				else {
					
					name = [NSString stringWithUTF8String:cName];
					NSLog(@"entered %@", name);
					[names addObject:name];
					// Apparently the addObject function in NSMutableArray does not
					// keep a copy of our object, so, we can't release it.
					//[name release];
				}
			}
			sqlite3_finalize(compiledStmt); // Cleanup the statement
		}
		else {
			NSLog(@"Error retrieving data from database.");
		}
		sqlite3_close(database);
	}
	else {
		NSLog(@"Error: Can't open database!");
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
	//myTableView.dataSource=self;
	names = [[NSMutableArray alloc] init];
	searchedNames = [[NSMutableArray alloc] init];
	[self loadNames];
	[searchedNames addObjectsFromArray:names];//initially load data into table
	
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}                             
/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return ([searchedNames count]);
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	/*NSString *cellText*/cell.textLabel.text= [searchedNames objectAtIndex:indexPath.row];
	//[cell.textLabel setText:cellText];
    
    return cell;
}


#pragma mark Search Functions
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
	[searchedNames removeAllObjects];// remove all data that belongs to previous search
	if([searchText isEqualToString:@""] || searchText==nil) {
		// Nothing to search, empty result.
		[myTableView reloadData];
		return;
	}
	
	for (NSString *name in names) {
		NSRange r = [name rangeOfString:searchText options:NSCaseInsensitiveSearch];
		if(r.location != NSNotFound) {
			[searchedNames addObject:name];
		}
	}
	[myTableView reloadData];	
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[searchBar resignFirstResponder];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

