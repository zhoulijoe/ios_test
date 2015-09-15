#import "ZLIConfigAssembly.h"
#import <Typhoon/Typhoon.h>
#import <Kiwi/Kiwi.h>

SPEC_BEGIN(TyphoonPropertyTest)

describe(@"Typhoon config", ^{
    __block ZLIConfigAssembly *assembly;

    beforeAll(^{
        assembly = [[ZLIConfigAssembly new] activate];
    });

    context(@"with single json property file", ^{
        it(@"inject simple string config property", ^{
            ZLITestObject *testObject = [assembly testObject];

            [[testObject.strProp should] equal:@"dev"];
        });
    });
});

SPEC_END
