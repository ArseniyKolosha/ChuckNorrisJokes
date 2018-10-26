//
//  Model.swift
//  ChuckNorrisJokes
//
//  Created by Ars on 10/25/18.
//  Copyright © 2018 ArsenIT. All rights reserved.
//http://api.icndb.com/jokes/random

import Foundation

func getRandomJoke() -> String {
    
    let url = URL(string: "http://api.icndb.com/jokes/random")!
    do {
        let dataJson =  try Data(contentsOf: url)
        let jsonDictionary = try JSONSerialization.jsonObject(with: dataJson, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        let value = jsonDictionary.object(forKey: "value")  as! NSDictionary
        return value.object(forKey: "joke") as! String
        
    } catch {
        print(error)
    }
    
    return ""
}
