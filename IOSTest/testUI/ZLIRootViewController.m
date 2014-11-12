#import "ZLIRootViewController.h"
#import "ZLISimpleViewController.h"

@interface ZLIRootViewController ()

@end

@implementation ZLIRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - view lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIStoryboard *simpleSB = [UIStoryboard storyboardWithName:@"simple" bundle:nil];
    UIViewController *simpleVC = [simpleSB instantiateInitialViewController];

    [self addChildViewController:simpleVC];
    [self.view addSubview:simpleVC.view];
    [simpleVC didMoveToParentViewController:self];
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

#pragma mark - test method

- (NSString *)dogMyCats:(NSString *)cats {
    return @"dogs";
}

@end
