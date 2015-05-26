//
//  FISSentence.m
//  OO-sentence
//
//  Created by Lukas Thoms on 5/26/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISSentence.h"

@implementation FISSentence

- (void) setWordArray:(NSMutableArray *)wordArray {
    _wordArray = @[@"How", @"are", @"you?"];
}

- (NSString *) stringFormat {
    NSString *stringFormat = [NSString stringWithFormat:@"%@ %@ %@", _wordArray[0], _wordArray[1], _wordArray[2] ];
    return stringFormat;
}

- (NSInteger) numOfWords {
    NSInteger numOfWords = 3;
    return numOfWords;
}

- (BOOL) containsWord:(NSString *)search {
    BOOL containsWord = [_wordArray containsObject:search];
    return containsWord;
}

-(NSMutableArray *) words {
    return _wordArray;
}

@end
