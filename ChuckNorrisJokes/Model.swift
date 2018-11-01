//
//  Model.swift
//  ChuckNorrisJokes
//
//  Created by Ars on 10/25/18.
//  Copyright © 2018 ArsenIT. All rights reserved.
//http://api.icndb.com/jokes/random

import Foundation

func getRandomJoke(block: (String) -> Void) {
    
    let url = URL(string: "http://api.icndb.com/jokes/random")!
    do {
        let dataJson =  try Data(contentsOf: url)
        let jsonDictionary = try JSONSerialization.jsonObject(with: dataJson, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        let value = jsonDictionary.object(forKey: "value")  as! NSDictionary
        
        
        block((value.object(forKey: "joke") as! String).replacingOccurrences(of: "&quot;", with: "''"))
        return
    } catch {
        print(error)
    }
    
    block("")
}

var jokes: [String]  {
    set {
        UserDefaults.standard.set(newValue, forKey: "jokes")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey:  "jokes"){
            return array as! [String]
        } else {
       return []
        }
    }
}

func addJokeToFavorites(newJoke: String)  {
    for j in jokes {
        if j == newJoke{
            return
        }
    }
    jokes.append(newJoke)
    
}

