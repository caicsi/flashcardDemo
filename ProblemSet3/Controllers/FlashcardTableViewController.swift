//
//  FlashcardTableViewController.swift
//  ProblemSet3
//
//  Created by Blanchard, Cai on 2/19/19.
//  Copyright © 2019 Blanchard, Cai. All rights reserved.
//

import Foundation

import UIKit

class FlashcardTableViewController: UITableViewController {
    
    let numCards: Int = 10
    var flashcards: [Card] = []
    var tableLanguage: String = "french"
    
    @IBOutlet weak var shuffleCards: UIBarButtonItem!
    @IBOutlet weak var SwitchLanguage: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "flashcardCell")
        
        let path = Bundle.main.path(forResource: "FlashcardVocab", ofType: "plist")
        var vocab: [[String]] = [[]]
        if let loadedVocab = NSArray(contentsOfFile: path!) as? [[String]] {
            vocab = loadedVocab
        } else {
            print("Error loading data from plist")
        }
        
        for i in 0..<numCards {
            flashcards.append(Card(english: vocab[i][0], french: vocab[i][1]))
        }
//        flashcards = [Card(english: "candy", french: "bonbon"),
//                        Card(english: "umbrella", french: "parapluie"),
//                        Card(english: "picnic", french: "pique-nique"),
//                        Card(english: "that's cool", french: "c'est chouette"),
//                        Card(english: "potato", french: "pomme de la terre"),
//                        Card(english: "skirt", french: "jupe"),
//                        Card(english: "grapefruit", french: "pamplemousse"),
//                        Card(english: "tiny owl", french: "chouette"),
//                        Card(english: "pencil", french: "crayon"),
//                        Card(english: "I am simply a little mouse", french: "je suis simplement une petite souris")]
        flashcards.shuffle()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numCards
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "flashcardCell") else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "flashcardCell", for: indexPath)
        let index = indexPath.row
        // let result = Int(pow(2.0, Double(power)))
        cell.textLabel?.text = "\(flashcards[index].getCardFront())"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Details", sender: self)
    }
    
    @IBAction func switchLanguageView(_ sender: UIBarButtonItem) {
        
        if tableLanguage == "french" {
            tableLanguage = "english"
        } else {
            tableLanguage = "french"
        }
        
        for flashcard in flashcards {
            flashcard.setLanguage(tableLanguage)
        }
        
        tableView.reloadData()
    }
    
    @IBAction func shuffleFlashCards(_ sender: UIBarButtonItem) {
        
        flashcards.shuffle()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Details" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let flashcard = flashcards[indexPath.row]
                if let controller = segue.destination as? DetailsViewController {
                    controller.translation = flashcard.getCardDetail()
                }
                
            }
        }
    }
    
}
