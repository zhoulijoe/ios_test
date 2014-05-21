#import "ZLISuperClass.h"

@interface ZLIPageContentViewController : UIViewController

@property (nonatomic, strong) ZLISuperClass *person;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)edgeTap:(id)sender;

@end
