#import <DDASLLogger.h>
#import <DDTTYLogger.h>

#import "ZLILogger.h"

const int ddLogLevel = DDLogLevelDebug;

@implementation ZLILogger

+ (void)attachLogger {
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

@end
