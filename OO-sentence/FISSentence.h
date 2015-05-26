//
//  FISSentence.h
//  OO-sentence
//
//  Created by Lukas Thoms on 5/26/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property (strong, nonatomic) NSMutableArray *wordArray;
- (NSString *) stringFormat;
- (NSInteger) numOfWords;
- (BOOL) containsWord;
- (NSMutableArray *) words;

@end
