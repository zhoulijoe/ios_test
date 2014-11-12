#import "ZLIShoutingPerson.h"


@implementation ZLIShoutingPerson

- (NSString *)saySomething:(NSString *)greeting {
    NSString *allCaps = [greeting uppercaseString];

    return [super saySomething:allCaps];
}

@end