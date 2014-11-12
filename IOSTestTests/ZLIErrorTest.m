#import "Kiwi.h"

static NSString *const ZLIErrorDomain = @"com.locationlabs.ZLIErrorDomain";

NS_ENUM(NSInteger, ZLIErrorCode) {
    ZLIErrorCode1
};

SPEC_BEGIN(Error)

describe(@"Error test", ^{
    context(@"NSError", ^{
        it(@"create an error", ^{
            NSDictionary *userInfo = @{
                NSLocalizedDescriptionKey : @"An error has occured"
            };
            NSError *error = [NSError errorWithDomain:ZLIErrorDomain code:ZLIErrorCode1 userInfo:userInfo];
            [[[error localizedDescription] should] equal:@"An error has occured"];
        });
    });

    context(@"exception", ^{
        it(@"try catch block", ^{
            BOOL finallyReached = NO;

            @try {
                NSArray *array = @[@1];
                NSNumber *num = [array objectAtIndex:1];
                NSLog(@"num=%@", num);
            }
            @catch (NSException *e) {
                [[e should] beNonNil];
            }
            @finally {
                finallyReached = YES;
            }

            [[theValue(finallyReached) should] beYes];
        });

        it(@"can be expected", ^{
            [[theBlock(^{
                NSArray *array = @[@1];
                NSNumber *num = [array objectAtIndex:1];
                NSLog(@"num=%@", num);
            }) should] raiseWithName:@"NSRangeException"];
        });
    });
});

SPEC_END
