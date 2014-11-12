#import "ZLISuperClass.h"
#import "Kiwi.h"

SPEC_BEGIN(Block)

describe(@"Block", ^{
    context(@"simple cases", ^{
        it(@"assert anonymous block", ^{
            ^{
                [[theValue(YES) should] equal:theValue(YES)];
            }();
        });

        it(@"assert in named block", ^{
            void (^simpleBlock)(void) = ^{
                [[theValue(YES) should] equal:theValue(YES)];
            };
            simpleBlock();

            ZLISimpleBlock simpleTypedBlock = ^{
                [[theValue(YES) should] equal:theValue(YES)];
            };
            simpleTypedBlock();
        });

        it(@"block with params", ^{
            double mutiplyResult = ^ double (double firstValue, double secondValue) {
                return firstValue * secondValue;
            }(2, 4);
            [[theValue(mutiplyResult) should] equal:theValue(8)];

            double (^multipleTwoValues)(double, double);
            multipleTwoValues = ^ double (double firstValue, double secondValue) {
                return firstValue * secondValue;
            };
            mutiplyResult = multipleTwoValues(2, 5);
            [[theValue(mutiplyResult) should] equal:theValue(10)];
        });
    });

    context(@"scope", ^{
        it(@"block captures variable value", ^{
            int intBeforeBlock = 10;
            void (^captureBlock)(void) = ^{
                [[theValue(intBeforeBlock) should] equal:theValue(10)];
            };
            intBeforeBlock = 50;
            [[theValue(intBeforeBlock) should] equal:theValue(50)];
            captureBlock();
        });

        it(@"block only captures the pointer address not the content of the object", ^{
            NSMutableString *mutableStr = [NSMutableString stringWithString:@"initial value"];
            void (^capturePtrBlock)(void) = ^{
                [[mutableStr should] equal:@"initial value appended value"];
            };
            [mutableStr appendString:@" appended value"];
            capturePtrBlock();
        });

        it(@"variable value could be changed inside block", ^{
            __block int intSharedBlock = 2;
            void (^captureShareBlock)(void) = ^{
                intSharedBlock = 7;
            };
            [[theValue(intSharedBlock) should] equal:theValue(2)];
            captureShareBlock();
            [[theValue(intSharedBlock) should] equal:theValue(7)];
        });

        it(@"copied block property should maintain original scope", ^{
            ZLISuperClass *classInstance = [ZLISuperClass new];

            int testInt = 1;
            classInstance.simpleBlockProperty = ^{
                [[theValue(testInt) should] equal:theValue(1)];
            };
            testInt = 2;
            classInstance.simpleBlockProperty();
        });

        it(@"use weak self to avoid retain cycle", ^{
            ZLISuperClass *classInstance = [ZLISuperClass new];
            ZLISuperClass * __weak weakClassInstance = classInstance;

            [classInstance methodWithBlockReferenceSelf];
            classInstance = nil;
            [[expectFutureValue(weakClassInstance) shouldEventually] beNil];
        });
    });

    context(@"block param", ^{
        it(@"excuting a block argument", ^{
            double result = [ZLISuperClass methodWithBlock:^ double (double x, double y) {
                return x + y;
            }];
            [[theValue(result) should] equal:theValue(15)];
        });
    });

    context(@"complex block", ^{
        it(@"a block that has a block param and returns a block", ^{
            __block int count = 0;

            void (^(^complexBlock)(void (^)(void)))(void) = ^ void (^(void (^aBlock)(void)))(void) {
                aBlock();

                count++;

                return ^{
                    count++;
                };
            };
            void (^returnedBlock)(void) = complexBlock(^{
                count++;
            });
            returnedBlock();

            [[theValue(count) should] equal:theValue(3)];
        });

        it(@"a block that has a block param and returns a block using defined block signature", ^{
            __block int count = 0;

            ZLISimpleBlock (^betterComplexBlock)(ZLISimpleBlock) = ^ ZLISimpleBlock (ZLISimpleBlock aBlock) {
                aBlock();

                count++;

                return ^{
                    count++;
                };
            };
            betterComplexBlock(^{
                count++;
            })();

            [[theValue(count) should] equal:theValue(3)];
        });
    });
});

SPEC_END
