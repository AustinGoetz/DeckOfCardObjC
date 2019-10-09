//
//  AMGCardController.m
//  DeckOfCardObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGCardController.h"

@implementation AMGCardController

// + defines this as a class method. Similar to static func
// Return with our card controller
// * is our pointer in memory for our card controller
// sharedController is our internal parameter
+ (AMGCardController *)sharedController
{
    // Maiking sure that our shared controller doesn't exist
    static AMGCardController * sharedController = nil;
    // Create a onceToken to keep track of how many times this method has been run
    // This is done on the dispatch_once_thread
    static dispatch_once_t onceToken;
    // Method that takes in our once token from above and runs a completion to allocate and initialize a AMGCardController
    dispatch_once(&onceToken, ^{
        sharedController = [AMGCardController new];
    });
    return sharedController;
}

// Defines a static constant for our baseURL with a string literal
static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new";

- (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<AMGCard *> *))completion
{
    // Defines a variable for our URL which uses bracket syntax vs. dot syntax like in swift
    NSURL * url = [NSURL URLWithString:baseURLString];
    NSString * cardCount = [@(numberOfCards) stringValue];
    NSURL * drawURL = [url URLByAppendingPathComponent:@"draw/"];
    
    NSURLComponents * urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem * queryItem = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    
    NSURL * finalURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            // Defining variable and pointing in memory for our top level dictionary calling our jsonserialization method with get an object with data,
            NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON %@", error);
                completion(nil);
                return;
            }
            // Define a variable for our cards array at the key "cards" from our TLD
            NSArray * cardsArray = topLevelDictionary[@"cards"];
            // Defining a placeholder variable that is declared as mutable so that we can later append to it
            NSMutableArray * cardPlaceholder = [NSMutableArray new];
            
            for (NSDictionary * dictionary in cardsArray)
            {
                AMGCard * card = [[AMGCard alloc] initWithDictionary:dictionary];
                [cardPlaceholder addObject:card];
            }
            completion(cardPlaceholder);
        }
    }]resume];
}

- (void)fetchImageFromCard:(AMGCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL * imageURL = [NSURL URLWithString:card.image];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            UIImage * image = [UIImage imageWithData:data];
            completion(image);
        }
    }]resume];
}

@end
