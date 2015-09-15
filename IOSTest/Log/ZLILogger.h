#import <CocoaLumberjack/CocoaLumberjack.h>

extern const int ddLogLevel;

@interface ZLILogger : NSObject

/**
 * Add CocoaLumberjack loggers for logging to console
 */
+ (void)attachLogger;

@end
