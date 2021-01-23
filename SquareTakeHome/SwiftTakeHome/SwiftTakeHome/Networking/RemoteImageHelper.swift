//
//  RemoteImageHelper.swift
//  SwiftTakeHome
//
//  Created by Jason Mo on 1/20/21.
//

import Foundation
import UIKit


/*
 Taken from my app, FoodMoods - Pulls photos from URL and returns the image
 */
class RemoteImageHelper {
    func retrieveImageFromUrl(imageUrl : URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        print(imageUrl)
        URLSession.shared.dataTask(with: imageUrl, completionHandler: completionHandler).resume()
        
    }
    func retrieveImage(urlString: String?, completionHandler: @escaping (UIImage?)-> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        retrieveImageFromUrl(imageUrl: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                completionHandler(image)
            }
        }
        
    }
}
