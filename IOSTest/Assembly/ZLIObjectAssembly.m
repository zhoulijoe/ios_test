#import "ZLIObjectAssembly.h"
#import "TyphoonMethod.h"
#import "ZLISuperClass.h"
#import "ZLISubbClass.h"

@implementation ZLIObjectAssembly

- (id)ZLISubbClass {
    return [TyphoonDefinition withClass:[ZLISubbClass class]];
}

- (id)ZLISuperClass {
    return [TyphoonDefinition withClass:[ZLISuperClass class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFirstName:lastName:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:@"Joe"];
            [initializer injectParameterWith:@"Black"];
        }];
    }];
}

- (id)ZLISuperClassWithAge:(NSNumber *)age happy:(NSNumber *)happy {
    return [TyphoonDefinition withClass:[ZLISuperClass class]configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(age) with:age];
        [definition injectProperty:@selector(happy) with:happy];
    }];
}

- (id)ZLISuperClassClassMethod {
    return [TyphoonDefinition withClass:[ZLISuperClass class]configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(superClass)];
    }];
}

- (id)ZLISuperClassProperty {
    return [TyphoonDefinition withClass:[ZLISuperClass class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(firstName) with:@"Jane"];
        [definition injectProperty:@selector(spouse) with:[self ZLISuperClass]];
    }];
}

- (id)ZLISuperClassMethod {
    return [TyphoonDefinition withClass:[ZLISuperClass class] configuration:^(TyphoonDefinition *definition) {
        [definition injectMethod:@selector(modifyFirstName:lastName:) parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:@"Jack"];
            [method injectParameterWith:@"Black"];
        }];
    }];
}

- (id)ZLISuperClassPrePostHook {
    return [TyphoonDefinition withClass:[ZLISuperClass class] configuration:^(TyphoonDefinition *definition) {
        definition.beforeInjections = @selector(measureHight);
        definition.afterInjections = @selector(superMethod);
        [definition injectProperty:@selector(firstName) with:@"Jane"];
        [definition injectProperty:@selector(spouse) with:[self ZLISuperClass]];
    }];
}

- (id)ZLISuperClassWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    return [TyphoonDefinition withClass:[ZLISuperClass class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFirstName:lastName:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:firstName];
            [initializer injectParameterWith:lastName];
        }];
    }];
}

- (id)ZLISuperClassWithCollection {
    return [TyphoonDefinition withClass:[ZLISuperClass class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(stackTrace) with:@[[self ZLISuperClass], [self ZLISubbClass]]];
    }];
}

@end
