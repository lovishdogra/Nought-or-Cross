//
//  ViewController.swift
//  Nought & Crosses
//
//  Created by Lovish Dogra on 09/03/16.
//  Copyright © 2016 Lovish Dogra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameActive = true
    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        if(gameState[sender.tag] == 0 && gameActive == true){
            gameState[sender.tag] = activePlayer
            if(activePlayer == 1){
                sender.setImage(UIImage(named: "nought"), for: UIControlState())
                activePlayer = 2
            } else{
                sender.setImage(UIImage(named: "cross"), for: UIControlState())
                activePlayer = 1
            }
            for combination in winningCombination{
                if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]){
                    gameActive = false
                    if gameState[combination[0]] == 1 {
                        gameOverLabel.text = "Nought Won!"
                    } else{
                        gameOverLabel.text = "Crosse Won!"
                    }
                    gameOverLabel.isHidden = false
                    UIView.animate(withDuration: 0.1, animations: { () -> Void in
                        self.gameOverLabel.center = CGPoint(x: self.gameOverLabel.center.x + 100, y: self.gameOverLabel.center.y)
                    })
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameOverLabel.isHidden = true
        gameOverLabel.center = CGPoint(x: gameOverLabel.center.x - 100, y: gameOverLabel.center.y)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

