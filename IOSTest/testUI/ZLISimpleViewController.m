#import "ZLISimpleViewController.h"

@interface ZLISimpleViewController ()

@end

@implementation ZLISimpleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)testButtonClick:(id)sender {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"AlertTitle", nil)
                                                 message:NSLocalizedString(@"AlertMessage", nil)
                                                delegate:nil
                                       cancelButtonTitle:NSLocalizedString(@"CancelTitle", nil)
                                       otherButtonTitles:nil];
    [av show];
}

@end
