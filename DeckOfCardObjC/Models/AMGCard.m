//
//  AMGCard.m
//  DeckOfCardObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGCard.h"

@implementation AMGCard

// Creating an instance type function, we start by defining what we want returned, external parameter/function name, followed by the type declaration and pointer in memory, this is followed by our internal name for each parameter and then we open the scope
- (instancetype)initWithCardSuit:(NSString *)suit image:(NSString *)image
{
    // Almost everything in OBJ-C is a class
    // When creating your own class, it is a subclass of NSObject, so we need to initialize the superclass first
    self = [super init];
    
    // If self exists, then initialize with our properties
    if (self)
    {
        // self.suit = suit
        _suit = suit;
        // self.image = image
        _image = image;
    }
    return self;
}

@end

// Extension on our AMGCard
@implementation AMGCard (JSONConvertable)

// 1: "-" Instance method
// 2: "(Any)" = What we are returning
// 3: "initWithDictionary:" External name for our first parameter
// 4: "(NSDictionary<NSString *,id> *)" = type declaration
// 5: "<NSString *,id>" is the key value pair that is returned from our dictionary. id means "Any" in objc
// 6: "*" is our pointer in memory
// 7: "dictionary" internal name for our class

- (AMGCard *)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * suit = dictionary[@"suit"];
    NSString * image = dictionary[@"image"];
    
    return [self initWithCardSuit:suit image:image];
}

@end
