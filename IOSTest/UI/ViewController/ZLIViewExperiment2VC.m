#import "ZLIViewExperiment2VC.h"
#import "ZLILogger.h"

@implementation ZLIViewExperiment2VC

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIView* v1 = [[UIView alloc] initWithFrame:CGRectMake(113, 111, 132, 194)];
    v1.backgroundColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    DDLogDebug(@"v1 bounds:%@ center:%@", NSStringFromCGRect(v1.bounds), NSStringFromCGPoint(v1.center));
    UIView* v2 = [[UIView alloc] initWithFrame:CGRectInset(v1.bounds, 10, 10)];
    v2.backgroundColor = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
    DDLogDebug(@"v2 bounds:%@ center:%@", NSStringFromCGRect(v2.bounds), NSStringFromCGPoint(v2.center));
    [self.view addSubview: v1];
    [v1 addSubview: v2];
}

@end
