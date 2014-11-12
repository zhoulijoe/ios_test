#import <Foundation/Foundation.h>
#import "ZLITest.h"

// Starts from 0
typedef NS_ENUM(NSInteger, ZLIDefaultEnum) {
    ZLIDefaultEnum1,
    ZLIDefaultEnum2
};

typedef NS_ENUM(NSInteger, ZLICustomEnum) {
    ZLICustomEnum1 = 10,
    ZLICustomEnum2 = 20
};

/**
 *
 */
@interface ZLIEnumTest : NSObject <ZLITest>

@end
