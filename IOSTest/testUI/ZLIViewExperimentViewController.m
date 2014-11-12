#import "ZLIViewExperimentViewController.h"

@implementation ZLIViewExperimentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createRedRect];
}

- (void)createRedRect {
    UIView *redRect = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    redRect.backgroundColor = [UIColor redColor];

    [self.view addSubview:redRect];
}

@end
