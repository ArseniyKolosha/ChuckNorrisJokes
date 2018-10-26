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
    @IBAction func pushShareAction(_ sender: Any) {
        let avc = UIActivityViewController(activityItems: [jokeLabel.text], applicationActivities: nil)
        present(avc, animated: true, completion: nil)
    }
    @IBAction func pushRefreshAction(_ sender: Any) {
        jokeLabel.text = getRandomJoke()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(getRandomJoke())
    }


}

