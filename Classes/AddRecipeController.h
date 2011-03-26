//
//  AddRecipeController.h
//  Recipe
//
//  Created by Amit Bijlani on 3/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddRecipeController : UIViewController  {
	
	UITextField* nameTextField;
	UITextField* descriptionTextField;
	UITextView* ingredientsTextView;
	UILabel* status;

}

@property (nonatomic,retain) IBOutlet UITextField* nameTextField;
@property (nonatomic,retain) IBOutlet UITextField* descriptionTextField;
@property (nonatomic,retain) IBOutlet UITextView* ingredientsTextView;
@property (nonatomic,retain) IBOutlet UILabel* status;

- (void) dismissKeyboard;

@end
