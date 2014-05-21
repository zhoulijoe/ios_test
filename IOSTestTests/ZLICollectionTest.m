#import "Kiwi.h"

SPEC_BEGIN(Collection)

describe(@"collection test", ^{
    context(@"array", ^{
        it(@"element in an immutable could still be modified", ^{
            NSMutableString *mutableString = [NSMutableString stringWithString:@"Mutable string"];
            NSArray *immutableArray = @[mutableString];

            if ([immutableArray count] > 0) {
                id item = immutableArray[0];
                if ([item isKindOfClass:[NSMutableString class]]) {
                    [item appendString:@" more stuff"];
                }
            }
            [[immutableArray should] equal:@[@"Mutable string more stuff"]];
        });

        it(@"can contain null, which is a shared singleton", ^{
            NSArray *arrayWithNull = @[@"firstItem", [NSNull null]];

            BOOL containsNull = NO;
            for (id item in arrayWithNull) {
                if (item == [NSNull null]) {
                    containsNull = YES;
                }
            }
            [[theValue(containsNull) should] beYes];
        });

        it(@"sort strings alphabetically", ^{
            NSArray *unsortedStrings = @[@"c", @"a", @"b"];
            NSArray *sortedStrings = [unsortedStrings sortedArrayUsingSelector:@selector(compare:)];
            [[sortedStrings should] equal:@[@"a", @"b", @"c"]];
        });

        it(@"mutable array elements can adjusted", ^{
            NSMutableArray *mutableArray = [NSMutableArray array];
            [mutableArray addObject:@"first"];
            [mutableArray addObject:@"second"];
            [mutableArray addObject:@"third"];
            [[mutableArray should] equal:@[@"first", @"second", @"third"]];

            [mutableArray replaceObjectAtIndex:2 withObject:@"fourth"];
            [[mutableArray should] equal:@[@"first", @"second", @"fourth"]];

            [mutableArray sortUsingSelector:@selector(caseInsensitiveCompare:)];
            [[mutableArray should] equal:@[@"first", @"fourth", @"second"]];
        });

        it(@"different ways to loop through", ^{
            NSArray *array = @[@"a", @"b", @"c"];

            for (int i = 0; i < [array count]; i++) {
                [[array[i] should] equal:array[i]];
            }

            NSUInteger i = 0;
            for (id item in array) {
                [[item should] equal:array[i]];
                i++;
            }

            i = [array count];
            for (id item in [array reverseObjectEnumerator]) {
                i--;
                [[item should] equal:array[i]];
            }

            id tmpItem;
            NSEnumerator *enumerator = [array objectEnumerator];
            while (tmpItem = [enumerator nextObject]) {
                [[tmpItem should] equal:array[i]];
                i++;
            }
        });

        it(@"block iterator", ^{
            NSMutableArray *intArray = [NSMutableArray array];
            for (int count = 0; count < 10; count++) {
                [intArray addObject:[NSNumber numberWithInt:count]];
            }
            [intArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                intArray[idx] = @([((NSNumber *)obj) intValue] + 1);
                if (idx == 5) {
                    *stop = YES;
                }
            }];
            [[expectFutureValue(intArray) shouldEventually] equal:@[@1, @2, @3, @4, @5, @6, @6, @7, @8, @9]];
        });

        it(@"writing and loading from file", ^{
            NSFileManager *fm = [NSFileManager new];
            NSURL *dir = [fm URLsForDirectory:NSCachesDirectory inDomains:NSLocalDomainMask][0];
            NSURL *fileURL = [dir URLByAppendingPathComponent:@"arrayfile"];
            NSLog(@"The fileURL is %@", fileURL);

            NSArray *arrayToWrite = @[@"a", @"b", @"c"];
            BOOL success = [arrayToWrite writeToURL:fileURL atomically:YES];
            [[theValue(success) should] beYes];

            NSArray *loadedArray = [NSArray arrayWithContentsOfURL:fileURL];
            [[loadedArray should] equal:arrayToWrite];

            [[[NSFileManager alloc] init] removeItemAtURL:fileURL error:nil];
        });
    });

    context(@"set", ^{
        it(@"elements in set are unique and easy to check for existence", ^{
            NSSet *numberSet = [NSSet setWithObjects:@20, @5, @10, @10, nil];
            [[theValue([numberSet containsObject:@5]) should] beYes];
            [[numberSet should] haveCountOf:3];
            [[numberSet should] contain:@10];
        });
    });

    context(@"dictionary", ^{
        it(@"get key", ^{
            NSDictionary *map = @{
                @"first" : @"firstValue",
                @"second" : @"secondValue"
            };
            
            [[map[@"first"] should] equal:@"firstValue"];
            [[[map should] have:2] items];
        });

        it(@"can be mutable", ^{
            NSMutableDictionary *mutableMap = [NSMutableDictionary dictionary];
            [mutableMap setObject:@"firstValue" forKey:@"first"];

            [[mutableMap[@"first"] should] equal:@"firstValue"];
        });

        it(@"loop through", ^{
            NSDictionary *map = @{
                @"first" : @"firstValue",
                @"second" : @"secondValue"
            };

            for (NSString *eachKey in map) {
                [[map[eachKey] should] equal:[map valueForKey:eachKey]];
            }
        });

        it(@"block iterator", ^{
            NSDictionary *dict = @{@"first" : @"firstValue",
                                   @"second" : @"secondValue"};
            [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                [[key should] equal:@"first"];
                [[obj should] equal:@"firstValue"];

                *stop=YES;
            }];
        });
    });
});

SPEC_END
