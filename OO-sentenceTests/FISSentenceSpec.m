//
//  FISSentenceSpec.m
//  OO-sentence
//
//  Created by Zachary Drossman on 9/15/14.
//  Copyright 2014 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#import "FISSentence.h"
#define EXP_SHORTHAND
#import "Expecta.h"

SpecBegin(FISSentence)

describe(@"FISSentence", ^{
    
    __block FISSentence *sentence;
    __block NSArray *testArrayEndingWithAnExclamationPoint;
    __block NSArray *testArrayEndingWithAQuestionMark;
    __block NSArray *testArrayEndingWithAPeriod;

    __block NSArray *testArrayWithoutCapitalization;
    __block NSArray *testArrayWithoutPunctuation;
    __block NSArray *testArrayWithoutCapitalizationOrPunctuation;

    __block NSArray *differentSentenceArray;

    beforeAll(^{

        sentence = [[FISSentence alloc] init];
        testArrayEndingWithAnExclamationPoint = @[@"Zach",@"is",@"a",@"teacher!"];
        testArrayEndingWithAQuestionMark = @[@"Zach",@"is",@"a",@"teacher?"];
        testArrayEndingWithAPeriod = @[@"Zach",@"is",@"a",@"teacher."];

        testArrayWithoutCapitalization = @[@"zach",@"is",@"a",@"teacher!"];
        testArrayWithoutPunctuation = @[@"Zach",@"is",@"a",@"teacher"];
        testArrayWithoutCapitalizationOrPunctuation = @[@"zach",@"is",@"a",@"teacher"];
        
        differentSentenceArray = @[@"joe",@"is",@"a",@"teacher"];
        
        [sentence setWords:[testArrayEndingWithAnExclamationPoint mutableCopy]];

    });
    
    describe(@"words accessor", ^{
        
        it(@"should get the words instance variable", ^{
            expect([sentence words]).to.equal(@[@"Zach",@"is",@"a",@"teacher!"]);
        });
        
    });
    
    describe(@"words setter", ^{
        
        it(@"should set the words instance variable", ^{
            FISSentence *newSentence = [[FISSentence alloc] init];
            [newSentence setWords:[@[@"Zach",@"is",@"an",@"instructor!"] mutableCopy]];
            expect([newSentence words]).to.equal(@[@"Zach",@"is",@"an",@"instructor!"]);
        });
        
    });
    
    describe(@"numOfWords", ^{
        
        it(@"should return the number of words in the words array", ^{
            expect([sentence numOfWords]).to.equal(@4);
        });
        
    });

    describe(@"containsWord", ^{
        
        it(@"should take a string as an argument and return true if the word is contained in the sentence", ^{
            expect([sentence containsWord:@"Zach"]).to.beTruthy();
        });
        
        it(@"should take a string as an argument and return false if the word is contained in the sentence but in a different case", ^{
            expect([sentence containsWord:@"zach"]).to.beFalsy();
        });
       
        it(@"should take a string as an argument and return false if seeking a partial word", ^{
            expect([sentence containsWord:@"Za"]).to.beFalsy();
        });
        
        it(@"should take a string as an argument and return false if the word is not contained in the sentence", ^{
            expect([sentence containsWord:@"Joe"]).to.beFalsy();
        });

    });

    describe(@"stringFormat", ^{
        
        it(@"should return a formatted sentence from the words instance variable", ^{
            expect([sentence stringFormat]).to.equal(@"Zach is a teacher!");
        });
        
    });

    describe(@"isProperSentence", ^{
        
        FISSentence *newSentence = [[FISSentence alloc] init];

        it(@"should return true if the words array form a proper sentence with capitaliation and punctuation", ^{
            expect([sentence isProperSentence]).to.beTruthy();
        });
        
        it(@"should return false if the words array form an improper sentence with capitalization but no punctuation", ^{
            [newSentence setWords:[testArrayWithoutPunctuation mutableCopy]];
            expect([newSentence isProperSentence]).to.beFalsy();
        });
        
        it(@"should return false if the words array form an improper sentence without capitalization but with punctuation", ^{
            [newSentence setWords:[testArrayWithoutCapitalization mutableCopy]];
            expect([newSentence isProperSentence]).to.beFalsy();
        });
        
        it(@"should return false if the words array form an improper sentence without capitalization and no punctuation", ^{
            [newSentence setWords:[testArrayWithoutCapitalizationOrPunctuation mutableCopy]];
            expect([newSentence isProperSentence]).to.beFalsy();
        });
        
        it (@"should return true if the words array form a proper sentence with capitalization and ending with a question mark", ^{
            [newSentence setWords:[testArrayEndingWithAQuestionMark mutableCopy]];
            expect([newSentence isProperSentence]).to.beTruthy();
        });
        
        it (@"should return true if the words array form a proper sentence with capitalization and ending with an exclamation point", ^{
            [newSentence setWords:[testArrayEndingWithAnExclamationPoint mutableCopy]];
            expect([newSentence isProperSentence]).to.beTruthy();
        });

        it (@"should return true if the words array form a proper sentence with capitalization and ending with a period", ^{
            [newSentence setWords:[testArrayEndingWithAPeriod mutableCopy]];
            expect([newSentence isProperSentence]).to.beTruthy();
        });

    });
    
    describe(@"isEqualToSentence", ^{
        
        FISSentence *newSentence = [[FISSentence alloc] init];
        

        it(@"should return true if the sentences are exactly the same", ^{
            [newSentence setWords:[testArrayEndingWithAnExclamationPoint mutableCopy]];
            expect([sentence  isEqualToSentence:newSentence]).to.beTruthy();
        });
        
        it(@"should return true if the sentence being matched has no punctuation and no capitalization but is otherwise the same", ^{
            [newSentence setWords:[testArrayWithoutCapitalizationOrPunctuation mutableCopy]];
            expect([sentence isEqualToSentence:newSentence]).to.beTruthy();
        });

        it(@"should return true if the sentences both have capitalization, but one has no punctuation", ^{
            [newSentence setWords:[testArrayWithoutPunctuation mutableCopy]];
            expect([sentence  isEqualToSentence:newSentence]).to.beTruthy();
        });
        
        it(@"should return true if the sentences both have punctuation, but one has no capitalization", ^{
            [newSentence setWords:[testArrayWithoutCapitalization mutableCopy]];
            expect([sentence  isEqualToSentence:newSentence]).to.beTruthy();
        });

        it(@"should return false if the sentences are actually different", ^{
            [newSentence setWords:[differentSentenceArray mutableCopy]];
            expect([sentence  isEqualToSentence:newSentence]).to.beFalsy();
        });
        

    });
    
});

SpecEnd
