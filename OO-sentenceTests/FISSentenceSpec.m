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
    __block NSArray *testArray;
    __block NSArray *sameSentenceArray;
    __block NSArray *differentSentenceArray;
    
    beforeAll(^{

        sentence = [[FISSentence alloc] init];
        testArray = @[@"Zach",@"is",@"a",@"teacher!"];
        sameSentenceArray = @[@"zach",@"is",@"a",@"teacher"];
        differentSentenceArray = @[@"joe",@"is",@"a",@"teacher"];
        
        [sentence setWords:[testArray mutableCopy]];

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

        it(@"should return a BOOL letting us know whether the words array form a proper sentence", ^{
            expect([sentence isProperSentence]).to.beTruthy();
            
            [newSentence setWords:[sameSentenceArray mutableCopy]];
            expect([newSentence isProperSentence]).to.beFalsy();
        });
        
        
    });
    
    //it occurs to me - we might have let something slip by yesterday - do we want the argument to also be a sentence instead of an array?

    describe(@"isEqualToSentence", ^{
        it(@"should return a BOOL letting us know whether two sentences are the same, excluding case and punctuation", ^{
            expect([sentence  isEqualToSentence:sameSentenceArray]).to.beTruthy();
            expect([sentence isEqualToSentence:differentSentenceArray]).to.beFalsy();
        });
    });
    
});

SpecEnd
