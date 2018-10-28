//
//  ViewController.swift
//  ChuckNorrisJokes
//
//  Created by Ars on 10/25/18.
//  Copyright © 2018 ArsenIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jokeLabel: UILabel!
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var addToFavoritesButton: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    
    @IBAction func pushToFavorites(_ sender: Any) {
        addJokeToFavorites(newJoke: jokeLabel!.text!)
    }
    @IBAction func pushShareAction(_ sender: Any) {
        let avc = UIActivityViewController(activityItems: [jokeLabel.text], applicationActivities: nil)
        present(avc, animated: true, completion: nil)
    }
    @IBAction func pushRefreshAction(_ sender: Any) {
        indicator.startAnimating()
        refreshButton.isEnabled = false
        getRandomJoke { (joke) in
            DispatchQueue.main.async {
                self.jokeLabel.text = joke
                self.indicator.stopAnimating()
                self.refreshButton.isEnabled = true
                self.shareButton.isEnabled = true
                self.addToFavoritesButton.isEnabled = true
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }


}

