#import "ZLISubbClass.h"

@implementation ZLISubbClass

- (void)superMethod {
    [super superMethod];

    [self.stackTrace addObject:[NSString stringWithUTF8String:__PRETTY_FUNCTION__]];
}

@end
