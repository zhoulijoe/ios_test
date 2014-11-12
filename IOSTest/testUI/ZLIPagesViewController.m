#import "ZLIPagesViewController.h"
#import "ZLISuperClass.h"
#import "ZLIPageContentViewController.h"

@interface ZLIPagesViewController () <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *superClasses;
@property (nonatomic, strong) NSMutableSet *observers;

@end

@implementation ZLIPagesViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _superClasses = @[
            [ZLISuperClass instanceWithFirstName:@"Joe" lastName:@"Black"],
            [ZLISuperClass instanceWithFirstName:@"Jack" lastName:@"Blue"],
            [ZLISuperClass instanceWithFirstName:@"Moe" lastName:@"Doe"]
        ];
        _observers = [NSMutableSet new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIPageViewController *pageViewVC = (UIPageViewController *)self.topViewController;
    pageViewVC.dataSource = self;

    ZLIPageContentViewController *pageContent = [self initializePageContent];
    pageContent.person = self.superClasses[0];

    [pageViewVC setViewControllers:@[pageContent]
                         direction:UIPageViewControllerNavigationDirectionForward
                          animated:NO
                        completion:nil];
    [self stylePageIndicator];
    [self flipPageWithTap:pageViewVC];
}

- (void)dealloc {
    for (id ob in self.observers) {
        [[NSNotificationCenter defaultCenter] removeObserver:ob];
    }
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    ZLIPageContentViewController *pageContent = (ZLIPageContentViewController *)viewController;
    NSUInteger idx = [self.superClasses indexOfObjectIdenticalTo:pageContent.person];

    if (idx == 0) {
        return nil;
    } else {
        ZLIPageContentViewController *pageContent = [self initializePageContent];
        pageContent.person = self.superClasses[idx - 1];
        return pageContent;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    ZLIPageContentViewController *pageContent = (ZLIPageContentViewController *)viewController;
    NSUInteger idx = [self.superClasses indexOfObjectIdenticalTo:pageContent.person];

    if (idx == [self.superClasses count] - 1) {
        return nil;
    } else {
        ZLIPageContentViewController *pageContent = [self initializePageContent];
        pageContent.person = self.superClasses[idx + 1];
        return pageContent;
    }
}

// Show page indicator
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.superClasses count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    ZLIPageContentViewController *pageContent = pageViewController.viewControllers[0];
    NSUInteger idx = [self.superClasses indexOfObjectIdenticalTo:pageContent.person];
    return idx;
}

- (void)stylePageIndicator {
    UIPageControl* proxy = [UIPageControl appearanceWhenContainedIn:[UIPageViewController class], nil];
    [proxy setPageIndicatorTintColor:[[UIColor redColor] colorWithAlphaComponent:0.6]];
    [proxy setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [proxy setBackgroundColor:[UIColor yellowColor]];
}

- (void)flipPageWithTap:(UIPageViewController *)pvc {
    id ob = [[NSNotificationCenter defaultCenter]
        addObserverForName:@"edgeTap"
                    object:nil
                     queue:nil
                usingBlock:^(NSNotification *n) {
                    UIGestureRecognizer *g = n.object;
                    NSInteger which = g.view.tag;
                    UIViewController* vc = which == 0 ?
                        [self pageViewController:pvc viewControllerBeforeViewController:pvc.viewControllers[0]] :
                        [self pageViewController:pvc viewControllerAfterViewController:pvc.viewControllers[0]];

                    if (!vc) {
                        return;
                    }

                    UIPageViewControllerNavigationDirection dir = which == 0 ?
                        UIPageViewControllerNavigationDirectionReverse :
                        UIPageViewControllerNavigationDirectionForward;
                    [pvc setViewControllers:@[vc] direction:dir animated:YES completion:nil];
                }];
    [self.observers addObject:ob];
}

- (ZLIPageContentViewController *)initializePageContent {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:@"ZLIPageContentViewController"];
}

@end
