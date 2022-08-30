//
//  DataSource.swift
//  Egg Harbor Township High School GPA Calculator
//
//  Created by Ryan Elyakoubi on 8/13/22.
//

import Foundation

class DataSource {
    public class func load<T:Decodable>(_ filename:String, as type:T.Type = T.self) -> T {
        let data:Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {fatalError("Couldn't find \(filename) in main Bundle.")}
        
        do {
            data = try Data(contentsOf: file)
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch {
                fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
            }
        } catch {
            fatalError("Couldn't find \(filename) from main Bundle:\n\(error)")
        }
    }
}
