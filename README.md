TA-UIAlertView-Blocks
=====================

Small UIKit category extending UIAlertView with blocks support by using
the objc_setAssociatedObject feature.

The sample code below creates an alert view with given title and message and by 
default an OK and cancel button (localizable). When the user taps the OK button
the code inside the block will be executed.


```objective-c
UIAlertView* alert = [[UIAlertView alloc]
                       initConfirmCancelDialogWithTitle:@"Title"
                       message:@"Message"
                       confirmBlock:^(void)
                       {
                           // Code to be executed when and only when the user
                           // clicks the confirm button...
                       }];
[alert show];
```