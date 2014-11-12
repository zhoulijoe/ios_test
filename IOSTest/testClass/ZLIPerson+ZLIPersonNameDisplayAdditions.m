#import "ZLIPerson+ZLIPersonNameDisplayAdditions.h"


@implementation ZLIPerson (ZLIPersonNameDisplayAdditions)

- (NSString *)lastNameFirstNameString {
    return [NSString stringWithFormat:@"%@, %@", self.lastName, self.firstName];
}

@end