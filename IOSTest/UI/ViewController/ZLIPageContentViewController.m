#import "ZLIPageContentViewController.h"
#import "ZLILogger.h"
#import "ZLISuperClass+ZLISuperClassCategory.h"

@implementation ZLIPageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nameLabel.text = [self.person lastNameFirstNameString];
    self.imageView.image = [UIImage imageNamed:self.person.imageName];
}

- (IBAction)edgeTap:(id)sender {
    DDLogDebug(@"Edge tapped");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"edgeTap" object:sender];
}

@end
