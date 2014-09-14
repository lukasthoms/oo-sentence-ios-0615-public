---
tags: beginner, instance-variables, oop, methods
languages: objc
---

# OO-Sentence

Let's represent a sentence in code.

## Instructions 

  1. First create a new class called `FISSentence`
  2. We are going to represent our sentence as an `NSArray` of `NSString`s. So to represent the sentence "How are you?" we would have an array like this `@[@"How", @"are", @"you?"]`. To do this we will need to hold state in our object. This means an instance variable! Create a `NSMutableArray` instance variable to hold your words.
  3. Write a method called `stringFormat` that returns an `NSString` that is the full sentence.
  4. Write a method called `numOfWords` that returns the number of words in the sentence.
  5. Write a method called `containsWord:` that takes an `NSString` to search for, and returns a `YES` or `NO` if that word is in the sentence.
  6. Write an accessor method called `words` that returns the instance variable containing all the words.

## Extra Credit

  1. Write a method called `isProperSentence` that ensures that the first word is capitalized and the last word as a punctuation mark.
  2. Write a method called `isEqualToSentence` that takes in another `FISSentence` object and returns a YES or NO if the sentences are the same. Be a bit loose with that definition. If the capitalization or punctuation is a bit different that is fine.
