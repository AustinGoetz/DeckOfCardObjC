//
//  AMGCardViewController.m
//  DeckOfCardObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

//#import "AMGCardViewController.h"
//#import "AMGCardController.h"
//#import "AMGCard.h"
//
//@interface AMGCardViewController ()
//
//@end
//
//@implementation AMGCardViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//
//- (IBAction)drawNewCardButtonTapped:(UIButton *)sender {
//    // Calling our draw card methon on our shared instance, we added an internal name for the array that we completed with an dused that array to fetch an image by passin in the first card in the array to our fetch image method
//    [AMGCardController.sharedController drawNewCard:1 completion:^(NSArray<AMGCard *> * cardArray) {
//        [AMGCardController.sharedController fetchImageFromCard:cardArray[0] completion:^(UIImage * image) {
//            // Same as dispatchqueue.main.async
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.cardImageView.image = image;
//                AMGCard * card = cardArray[0];
//                self.suitLabel.text = card.suit;
//            });
//        }];
//    }];
//}
//@end
