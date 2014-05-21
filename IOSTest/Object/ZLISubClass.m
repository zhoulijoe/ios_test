#import "ZLISubClass.h"

@implementation ZLISubClass

- (NSString *)saySomething:(NSString *)greeting {
    NSString *allCaps = [greeting uppercaseString];

    return [super saySomething:allCaps];
}

@end
