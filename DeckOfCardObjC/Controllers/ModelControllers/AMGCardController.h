//
//  AMGCardController.h
//  DeckOfCardObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AMGCard.h"

@interface AMGCardController : NSObject

+ (AMGCardController *)sharedController;

- (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^) (NSArray <AMGCard *> *))completion;

+ (void)fetchImageFromCard:(AMGCard *)card completion:(void (^) (UIImage*))completion;

@end
