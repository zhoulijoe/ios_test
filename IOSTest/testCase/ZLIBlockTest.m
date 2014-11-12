#import "ZLIBlockTest.h"

@implementation ZLIBlockTest

+ (void)runTest {
    void (^simpleBlock)(void) = ^{
        NSLog(@"This is a simple block");
    };
    simpleBlock();
    
    ZLISimpleBlock simpleBlockTest = ^{
        NSLog(@"Simple block with typedef");
    };
    simpleBlockTest();
    
    double mutiplyResult =
        ^ double (double firstValue, double secondValue) {
            return firstValue * secondValue;
        }(2, 4);
    NSLog(@"result is %f", mutiplyResult);
    
    double (^multipleTwoValues)(double, double);
    multipleTwoValues =
        ^ double (double firstValue, double secondValue) {
            return firstValue * secondValue;
        };
    NSLog(@"result is %f", multipleTwoValues(3, 4));
    
    int testInt = 10;
    void (^captureBlock)(void) = ^{
        NSLog(@"Int inside block: %i", testInt);
    };
    testInt = 50;
    captureBlock();
    
    // block only captures the pointer address not the content of the object
    NSMutableString *mutableStr = [NSMutableString stringWithString:@"initial string"];
    void (^capturePtrBlock)(void) = ^{
        NSLog(@"captured string is %@", mutableStr);
    };
    [mutableStr appendString:@" with more content"];
    capturePtrBlock();
    
    __block int intSharedBlock = 2;
    void (^captureShareBlock)(void) = ^{
        NSLog(@"Int inside block: %i", intSharedBlock);
        intSharedBlock = 7;
    };
    intSharedBlock = 5;
    captureShareBlock();
    NSLog(@"value of shared int: %i", intSharedBlock);
    
    [self methodWithBlock:multipleTwoValues];
    
    void (^(^complexBlock)(void (^)(void)))(void) = ^ void (^(void (^aBlock)(void)))(void) {
        aBlock();
        
        return ^{
            NSLog(@"returned from complexBlock");
        };
    };
    void (^returnedBlock)(void) = complexBlock(simpleBlock);
    returnedBlock();
    
    ZLISimpleBlock (^betterComplexBlock)(ZLISimpleBlock) = ^ ZLISimpleBlock (ZLISimpleBlock aBlock) {
        aBlock();
        
        return ^{
            NSLog(@"returned from betterComplexBlock");
        };
    };
    betterComplexBlock(simpleBlock)();
    
    NSMutableArray *intArray = [NSMutableArray array];
    for (int count = 0; count < 20; count++) {
        [intArray addObject:[NSNumber numberWithInt:count]];
    }
    [intArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        intArray[idx] = @( [((NSNumber *)obj) intValue] + 1 );
        if (idx == 10) {
            *stop = YES;
        }
    }];
    NSLog(@"incremented number array: %@", intArray);
    
    NSDictionary *dict = @{@"first" : @"firstValue",
                           @"second" : @"secondValue"};
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"%@ : %@", key, obj);
    }];
    
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:simpleBlock];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [mainQueue addOperation:operation];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, simpleBlock);
}

+ (void)methodWithBlock:(double (^)(double, double))block {
    NSLog(@"result is %f", block(2, 10));
}

- (id)init {
    self = [super init];
    
    ZLIBlockTest * __weak weakSelf = self;
    if (self) {
        _blockProperty = ^{
            [weakSelf dummyInstanceMethod];
        };
    }
    
    return self;
}

- (void)dummyInstanceMethod {
    NSLog(@"excuting dummyInstanceMethod");
}

@end
