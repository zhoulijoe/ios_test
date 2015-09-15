/**
 * Helper methods for dealing with numbers
 */
@interface ZLIMathUtil : NSObject

/**
 * Generate a random integer in between the bounds; inclusive
 *
 * @param lowerBound lower bound of integer
 * @param upperBound upper bound of integer
 *
 * @return random integer
 */
+ (int)getRandomIntBetween:(int)lowerBound UpperBound:(int)upperBound;

@end
