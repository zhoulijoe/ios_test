#import "ZLIMathUtil.h"

@implementation ZLIMathUtil

+ (int)getRandomIntBetween:(int)lowerBound UpperBound:(int)upperBound {
    return lowerBound + arc4random() % (upperBound - lowerBound);
}

@end
