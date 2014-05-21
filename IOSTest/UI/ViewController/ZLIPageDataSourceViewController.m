#import "ZLIPageDataSourceViewController.h"

@interface ZLIPageDataSourceViewController () <UIPageViewControllerDataSource>

@property (nonatomic) NSArray *pages;

@end

@implementation ZLIPageDataSourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIPageViewController *pageViewVC = (UIPageViewController *)self.topViewController;
    pageViewVC.dataSource = self;

    self.pages = @[
        [sb instantiateViewControllerWithIdentifier:@"ZLIPurpleViewController"],
        [sb instantiateViewControllerWithIdentifier:@"ZLIBlueViewController"]
    ];
    NSArray *viewControllers = @[self.pages[0]];
    [pageViewVC setViewControllers:viewControllers
                         direction:UIPageViewControllerNavigationDirectionForward
                          animated:NO
                        completion:nil];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger idx = [self.pages indexOfObjectIdenticalTo:viewController];

    if (idx == 0) {
        return nil;
    } else {
        return self.pages[idx - 1];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger idx = [self.pages indexOfObjectIdenticalTo:viewController];

    if (idx == [self.pages count] - 1) {
        return nil;
    } else {
        return self.pages[idx + 1];
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
