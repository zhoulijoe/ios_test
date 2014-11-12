#import "ZLIDummyErrorFactory.h"

NSString * const ZLIDummyErrorDomain = @"com.locationlabs.ZLIDummyErrorDomain";

@implementation ZLIDummyErrorFactory

+ (NSString *)domain {
    return ZLIDummyErrorDomain;
}

@end
