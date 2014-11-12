//
//  ZLISubbClass.m
//  objectivec_test
//
//  Created by Zhou on 4/22/14.
//  Copyright (c) 2014 ___ZHOU___. All rights reserved.
//

#import "ZLISubbClass.h"

@implementation ZLISubbClass

+ (void)classMethod {
    NSLog(@"Calling %@", NSStringFromSelector(_cmd));
}

- (void)testMethod {
    [super testMethod];

    NSLog(@"test method in subbClass");
}

@end
