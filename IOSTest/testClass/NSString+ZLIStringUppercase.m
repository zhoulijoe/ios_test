#import "NSString+ZLIStringUppercase.h"


@implementation NSString (ZLIStringUppercase)

- (void)zli_drawUpperCaseAtPoint:(CGPoint)point withAttributes:(NSDictionary *)attrs {
    NSString *uppercase = [self uppercaseString];

    [uppercase zli_drawUpperCaseAtPoint:point withAttributes:attrs];
}

@end