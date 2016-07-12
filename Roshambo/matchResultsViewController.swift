//
//  matchResultsViewController.swift
//  Roshambo
//
//  Created by CJ Gaspari on 7/11/16.
//  Copyright © 2016 CJ Gaspari. All rights reserved.
//

import UIKit

enum Shape: String {
	case stone = "rock"
	case papyrus = "paper"
	case metal = "scissors"
	
	static func generateShape() -> Shape {
		let shapes = ["rock", "paper", "scissors"]
		let randomChoice = Int(arc4random_uniform(3))
		return Shape(rawValue: shapes[randomChoice])!
		
	}
}

class matchResultsViewController: UIViewController {
	
	var userPlayChoice: Shape!
	private let compPlayChoice: Shape = Shape.generateShape()

	@IBOutlet weak var outcomeLabel: UILabel!
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(true)
		gamePlayResults()
	}
	
	private func gamePlayResults() {
		switch (userPlayChoice!, compPlayChoice) {
		case let (player, comp) where player == comp:
			outcomeLabel.text = "It's a tie!"
		case (.stone, .metal), (.papyrus, .stone), (.metal, .papyrus):
			outcomeLabel.text = "You win!"
		default:
			outcomeLabel.text = "You lose!"
		}
	}
	
	@IBAction func playAgain() {
		dismissViewControllerAnimated(true, completion: nil)
	}
	
}
