

//
//  ViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 22/09/20.
//  Copyright © 2020 FIAP. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    var movies: [Movie] = []
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }
    
    // MARK: - IBActions
    
    // MARK: - Methods
    private func loadMovies() {
        guard let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json") else {return}
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            //jsonDecoder.dateDecodingStrategy = .iso8601
            movies = try jsonDecoder.decode([Movie].self, from: jsonData)
            movies.forEach{print($0.title, $0.image)}
        } catch {
            print(error)
        }
        
    }
}
