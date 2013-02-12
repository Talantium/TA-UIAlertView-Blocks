//
//  UIAlertView+Blocks.h
//
//  Created by Andreas Hanft on 25.05.11.
//  Copyright 2013 talantium.net. All rights reserved.
//

@interface UIAlertView (Blocks)

- (id) initConfirmCancelDialogWithTitle:(NSString*)title
                                message:(NSString*)message
                           confirmBlock:(void (^)(void))confirmBlock;

@end
