// Provide method to draw string in uppercase

#import <Foundation/Foundation.h>

@interface NSString (ZLIStringUppercase)

- (void)zli_drawUpperCaseAtPoint:(CGPoint)point withAttributes:(NSDictionary *)attrs;

@end