//
//  AMGCard.h
//  DeckOfCardObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMGCard : NSObject

@property (nonatomic, copy, readonly) NSString * suit;
@property (nonatomic, copy, readonly) NSString * image;

- (instancetype)initWithCardSuit:(NSString *)suit
                           image:(NSString *)image;


@end

@interface AMGCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *) dictionary;

@end

NS_ASSUME_NONNULL_END
