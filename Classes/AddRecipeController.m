//
//  AddRecipeController.m
//  Recipe
//
//  Created by Amit Bijlani on 3/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddRecipeController.h"
#import "RecipeAppDelegate.h"


@implementation AddRecipeController

@synthesize nameTextField, descriptionTextField, ingredientsTextView, status;

/*
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
  }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"New Recipe";
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveRecipe:)];
	
}


- (void) saveRecipe: (id) sender {
	
	RecipeAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
	
	NSManagedObjectContext* managedObjectContext = delegate.managedObjectContext;
	
	NSManagedObject* newRecipe;
	
	newRecipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:managedObjectContext];
	
	[newRecipe setValue:nameTextField.text forKey:@"Name"];
	[newRecipe setValue:descriptionTextField.text forKey:@"Description"];
	[newRecipe setValue:ingredientsTextView.text forKey:@"Ingredients"];
	
	NSError* error;
	[managedObjectContext save:&error];
	
	status.text = @"Recipe Saved!";
	
	[self dismissKeyboard];
}

- (void) dismissKeyboard {
	[nameTextField resignFirstResponder];
	[descriptionTextField resignFirstResponder];
	[ingredientsTextView resignFirstResponder];
}





/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[status release];
	[nameTextField release];
	[descriptionTextField release];
	[ingredientsTextView release];
    [super dealloc];
}


@end
