#import "ZLICollectionTest.h"

@implementation ZLICollectionTest

+ (void)runTest {
    NSArray *unsortedStrings = @[@"c", @"a", @"b"];
    NSArray *sortedStrings = [unsortedStrings sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@", sortedStrings);
    
    NSMutableString *mutableString = [NSMutableString stringWithString:@"Mutable string"];
    NSArray *immutableArray = @[mutableString];
    
    if ([immutableArray count] > 0) {
        id item = immutableArray[0];
        if ([item isKindOfClass:[NSMutableString class]]) {
            [item appendString:@" more stuff"];
        }
    }
    
    NSLog(@"%@", immutableArray);
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    [mutableArray addObject:@"first"];
    [mutableArray addObject:@"second"];
    [mutableArray addObject:@"third"];
    
    NSLog(@"%@", mutableArray);
    
    [mutableArray replaceObjectAtIndex:2 withObject:@"fourth"];
    
    NSLog(@"%@", mutableArray);
    
    [mutableArray sortUsingSelector:@selector(caseInsensitiveCompare:)];
    
    NSLog(@"%@", mutableArray);
    
    NSSet *numberSet = [NSSet setWithObjects:@20, @5, @10, @10, nil];
    
    NSLog(@"%@ contains 5? %s", numberSet, [numberSet containsObject:@5] ? "true" : "false");
    
    NSDictionary *map = @{
              @"first" : @"firstValue",
             @"second" : @"secondValue"
    };
    
    NSLog(@"first value is %@", map[@"first"]);
    
    NSMutableDictionary *mutableMap = [NSMutableDictionary dictionary];
    
    [mutableMap setObject:@"firstValue" forKey:@"first"];
    
    NSLog(@"first value is %@", mutableMap[@"first"]);
    
    NSArray *arrayWithNull = @[ @"firstItem", [NSNull null] ];
    
    NSLog(@"%@", arrayWithNull);
    
    for (id item in arrayWithNull) {
        if (item == [NSNull null]) {
            NSLog(@"array contains null");
        }
    }
    
    NSURL *fileURL = [NSURL URLWithString:@"file:///Users/zhou/tmp/testfile"];
    BOOL success = [mutableArray writeToURL:fileURL atomically:YES];
    NSLog(@"Successfully wrote to file? %s", success ? "true" : "false");
    NSArray *loadedArray = [NSArray arrayWithContentsOfURL:fileURL];
    NSLog(@"loaded array %@", loadedArray);
    
    for (int i = 0; i < [mutableArray count]; i++) {
        NSLog(@"item at %d = %@", i, mutableArray[i]);
    }
    
    for (id item in mutableArray) {
        NSLog(@"Object: %@", item);
    }
    
    for (id item in [mutableArray reverseObjectEnumerator]) {
        NSLog(@"Reverse order object: %@", item);
    }
    
    id tmpItem;
    NSEnumerator *enumerator = [mutableArray objectEnumerator];
    while ( (tmpItem = [enumerator nextObject]) ) {
        NSLog(@"Enumerating item: %@", tmpItem);
    }
    
    for (NSString *eachKey in map) {
        NSLog(@"key: %@, value: %@", eachKey, map[eachKey]);
    }
    
    int nilInt;
    
    NSLog(@"%d", nilInt);
}

@end
