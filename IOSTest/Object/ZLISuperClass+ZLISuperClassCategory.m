#import "ZLISuperClass+ZLISuperClassCategory.h"

@implementation ZLISuperClass (ZLISuperClassCategory)

- (void)superCatMethod {
    [self.stackTrace addObject:[NSString stringWithUTF8String:__PRETTY_FUNCTION__]];
}

- (NSString *)lastNameFirstNameString {
    return [NSString stringWithFormat:@"%@, %@", self.lastName, self.firstName];
}

@end
