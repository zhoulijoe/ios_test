#import "ZLIMainMenuTableViewController.h"

@implementation ZLIMainMenuTableViewController

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
}

@end
