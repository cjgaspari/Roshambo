//
//  beginMatchViewController.swift
//  Roshambo
//
//  Created by CJ Gaspari on 7/11/16.
//  Copyright © 2016 CJ Gaspari. All rights reserved.
//

import UIKit

class beginMatchViewController: UIViewController {
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "play" {
			let view = segue.destinationViewController as! matchResultsViewController
			view.userPlayChoice = getSelectedShape(sender as! UIButton)
			
		}
	}
	
	@IBAction func playPaper(sender: UIButton) {
		performSegueWithIdentifier("play", sender: sender)
		//print(sender.titleLabel?.text)
		
	}
	

	@IBAction func playRock(sender: UIButton) {
		let view = self.storyboard?.instantiateViewControllerWithIdentifier("resultsViewController") as! matchResultsViewController
		view.userPlayChoice = getSelectedShape(sender)
		presentViewController(view, animated: true, completion: nil)
		
	}
	
	func getSelectedShape(sender: UIButton) -> Shape {
		let shape = sender.titleForState(.Normal)!
		return Shape(rawValue: shape)!
	}
	
	
	
}

