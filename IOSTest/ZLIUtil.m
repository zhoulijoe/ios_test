#import "ZLIUtil.h"

@implementation ZLIUtil

+ (int)getRandomIntBetween:(int)lowerBound UpperBound:(int)upperBound {
    return lowerBound + arc4random() % (upperBound - lowerBound);
}

@end