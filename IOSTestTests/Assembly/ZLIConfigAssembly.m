#import "ZLIConfigAssembly.h"

@implementation ZLIConfigAssembly

- (id)configurer {
    return [TyphoonDefinition configDefinitionWithName:@"default.json"
                                                bundle:[NSBundle bundleForClass:self.class]];
}

- (ZLITestObject *)testObject {
    return [TyphoonDefinition withClass:[ZLITestObject class]
                          configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(strProp) with:TyphoonConfig(@"env")];
    }];
}

@end
