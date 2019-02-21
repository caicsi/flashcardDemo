//
//  DetailsViewController.swift
//  ProblemSet3
//
//  Created by Blanchard, Cai on 2/20/19.
//  Copyright © 2019 Blanchard, Cai. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var translationLabel: UILabel!
    
    var translation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        translationLabel.text = translation 
    }
    
    
}
