#import "ZLIViewExperimentViewController.h"

@implementation ZLIViewExperimentViewController

# pragma mark - Life cycle

- (void)loadView {
    self.view = [UIView new];

    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createRedRect];
}

# pragma mark - Helper method

- (void)createRedRect {
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 130, 190)];
    v1.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:1 alpha:1];
    [self.view addSubview:v1];

    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 130, 190)];
    v2.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    [v1 addSubview:v2];

    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(50, 190, 130, 190)];
    v3.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    [self.view addSubview:v3];
}

@end
