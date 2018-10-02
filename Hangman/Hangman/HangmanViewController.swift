//
//  HangmanViewController.swift
//  Hangman
//
//  Created by Serena Wu on 10/1/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    var hangmangame = HangmanGame()
    var imageList = [#imageLiteral(resourceName: "hangman1"), #imageLiteral(resourceName: "hangman2"), #imageLiteral(resourceName: "hangman3"), #imageLiteral(resourceName: "hangman4"), #imageLiteral(resourceName: "hangman5"), #imageLiteral(resourceName: "hangman6"), #imageLiteral(resourceName: "hangman7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayString.text = hangmangame.display()
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var IncorrectGuesses: UILabel!
    @IBOutlet weak var GuessWord: UILabel!
    @IBOutlet weak var HangmanImageView: UIImageView!
    @IBOutlet weak var DisplayString: UILabel!
    
    @IBAction func ExitGame(_ sender: UIButton) {
        exit(0)
    }
    
    @IBAction func StartOver(_ sender: UIButton) {
        helperStartOver()
    }
    
    func helperStartOver() -> Void {
        hangmangame = HangmanGame()
        
        IncorrectGuesses.text = ""
        GuessWord.text = ""
        HangmanImageView.image = imageList[0]
        DisplayString.text = hangmangame.display()
    }
    
    @IBAction func GuessButton(_ sender: UIButton) {
        
        if (GuessWord.text != nil) {
            var a: [String] = hangmangame.change(title: GuessWord.text!)
            IncorrectGuesses.text = a[0]
            DisplayString.text = a[1]
            
            let tempString: String? = DisplayString.text
            if tempString != nil {
                if !(tempString!.contains("-")) {
                    alertHelper(msg: "Win", act: "New Game")
                }
            }
            
            let temp: Int? = Int(a[2])
            if temp != nil {
                if temp! < 6 {
                    HangmanImageView.image = imageList[temp!]
                } else if temp == 6 {
                    HangmanImageView.image = imageList[temp!]
                    alertHelper(msg: "Game Over", act: "Start Over")
                }
            }
        }

    }
    
    func alertHelper(msg: String, act: String) -> Void {
        let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: act, style: .default) { (action:UIAlertAction) in
            self.helperStartOver()
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func touchLetter(_ sender: UIButton) {
        GuessWord.text = sender.currentTitle
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
