//
//  AMGSwiftCardViewController.swift
//  DeckOfCardObjC
//
//  Created by Austin Goetz on 10/8/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class AMGSwiftCardViewController: UIViewController {
    
    @IBOutlet weak var suitLabelOutlet: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var drawCardButton: UIButton!
    
    var cards: [AMGCard]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawACard()
    }
    
    
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        drawACard()
    }
    
    func drawACard() {
    
        AMGCardController.shared()?.drawNewCard( 1, completion: { (cards) in
            guard let cards = cards else {return}
            let card = cards[0]
            
            AMGCardController.fetchImage(from: card, completion: { (image) in
                guard let image = image else {return}
                    DispatchQueue.main.async {
                        self.cardImageView.image = image
                        self.suitLabelOutlet.text = card.suit
                    }
                })
            })
        }
    }

