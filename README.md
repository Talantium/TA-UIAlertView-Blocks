TA-UIAlertView-Blocks
=====================

Small UIKit category extending UIAlertView with simple blocks support by using
the objc_setAssociatedObject feature. Does not support ARC, if used in an ARC 
project be sure to use the '-fno-objc-arc' compile flag.

The sample code below creates an alert view with given title and message and by 
default an OK and cancel button (localizable). When the user taps the OK button
the code inside the given block will be executed otherwise it gets discarded.


```objective-c
UIAlertView* alert = [[[UIAlertView alloc]
                       initConfirmCancelDialogWithTitle:@"Title"
                       message:@"Message"
                       confirmBlock:^(void)
                       {
                           // Code to be executed when and only when the user
                           // clicks the confirm button...
                       }]
                      autorelease];
[alert show];
```