//
//  UIAlertView+Blocks.m
//
//  Created by Andreas Hanft on 25.05.11.
//  Copyright 2013 talantium.net. All rights reserved.
//

#import "UIAlertView+Blocks.h"

#import <objc/runtime.h>


const void* UIAlertViewBlocksBlockKey;


@implementation UIAlertView (Blocks)

- (id) initConfirmCancelDialogWithTitle:(NSString*)title
                                message:(NSString*)message
                           confirmBlock:(void (^)(void))confirmBlock
{
	self = [self initWithTitle:title
                       message:message
                      delegate:self
             cancelButtonTitle:NSLocalizedString(@"Cancel", @"Cancel")
             otherButtonTitles:NSLocalizedString(@"OK", @"OK"), nil
			];
	
	if (self != nil)
	{
        // Save the block as associative object to self using key
        objc_setAssociatedObject(self,
                                 UIAlertViewBlocksBlockKey,
                                 [confirmBlock copy],
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
    
	return self;
}

- (void) alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != alertView.cancelButtonIndex) // OK Button
	{
        // Retrieve block
        void (^confirmBlock)(void) = objc_getAssociatedObject(self, UIAlertViewBlocksBlockKey);
        
        // Execute if valid
        if (confirmBlock)
            confirmBlock();
	}
    
    // Clean up block
    objc_setAssociatedObject(self,
                             UIAlertViewBlocksBlockKey,
                             nil,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void) dealloc
{    
    // Clean up block just in case alert was cleared without user action
    objc_setAssociatedObject(self,
                             UIAlertViewBlocksBlockKey,
                             nil,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
