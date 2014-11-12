#import "ZLIErrorTest.h"
#import "ZLIDummyErrorFactory.h"

@implementation ZLIErrorTest

+ (void)runTest {
//    NSURL *fileURL = [NSURL URLWithString:@"file:///Users/zhou/tmp/testfile"];
//    NSData *data = [NSData new];
//    BOOL success = [data writeToURL:fileURL options:0 error:nil];
    
    @try {
        NSArray *array = @[@1];
        NSNumber *num = [array objectAtIndex:1];
        NSLog(@"num=%@", num);
    }
    @catch (NSException *e) {
        NSLog(@"exception caught: %@", e);
    }
    @finally {
        NSLog(@"excuting finally");
    }

    NSError *dummyError = [ZLIDummyErrorFactory errorWithErrorCode:ZLIDummyErrorCode1];
    NSLog(@"dummyError: %@", dummyError);
}

@end
