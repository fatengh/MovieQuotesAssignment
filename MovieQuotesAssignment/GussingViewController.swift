//
//  GussingViewController.swift
//  MovieQuotesAssignment
//
//  Created by admin on 21/12/2021.
//

import UIKit
import CCAutocomplete

class GussingViewController: UIViewController {
    
    var selectedMovies: [Movies] = []
    
    var score = 0
    var randomNum = -1
    var correctAnswer = ""
    var totalScore = 0
    var x = 0
    
    var currentQuote: Movies? = nil
    
    @IBOutlet weak var gussingLebel: UITextField!
    @IBOutlet weak var scoreLebel: UILabel!
    @IBOutlet weak var quotesLebel: UILabel!
    
   
    @IBAction func backPressed(_ sender: UIBarButtonItem) {
        selectedMovies.removeAll()
    }
    
   
    
    @IBAction func infoPressed(_ sender: UIButton) {
        
        quotesLebel.text = "The Movie is: \(correctAnswer)"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        totalScore = selectedMovies.count
               gussingQustion()
    }
    

    func gussingQustion(){
        
            if selectedMovies.count > 0 {
                randomNum = Int.random(in: 0..<selectedMovies.count)
                currentQuote = selectedMovies[randomNum]
                quotesLebel.text = currentQuote?.quotes
                correctAnswer = currentQuote!.name
                selectedMovies.remove(at: randomNum)
            }
            else{
                quotesLebel.text = ""
            }
            scoreLebel.text = "Score: \(score) out of \(selectedMovies.count)"
        }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        
        if gussingLebel.text == correctAnswer{
                       score += 1
                       gussingQustion()
                       gussingLebel.text = ""
                   }else
                   {
                       quotesLebel.text = "wrong answer"
                       gussingQustion()
                   }
                   
               
              
        
    }
}
