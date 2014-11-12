#import "ZLISimpleViewController.h"

@implementation ZLISimpleViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self = [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)testButtonClick:(id)sender {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"AlertTitle", nil)
                                                 message:NSLocalizedString(@"AlertMessage", nil)
                                                delegate:nil
                                       cancelButtonTitle:NSLocalizedString(@"CancelTitle", nil)
                                       otherButtonTitles:nil];
    [av show];
}

@end
