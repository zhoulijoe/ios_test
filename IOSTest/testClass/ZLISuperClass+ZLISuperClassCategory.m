#import "ZLISuperClass+ZLISuperClassCategory.h"

@implementation ZLISuperClass (ZLISuperClassCategory)

- (void)superCatMethod {
    NSLog(@"Calling %@", NSStringFromSelector(_cmd));
}

@end
