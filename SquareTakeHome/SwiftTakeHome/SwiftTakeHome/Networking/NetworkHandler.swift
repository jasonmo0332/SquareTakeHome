//
//  NetworkHandler.swift
//  SwiftTakeHome
//  NetworkHandler created to pull data from Endpoints. Additional queries/parameters can be added if needed, and the URL components ensure that the URL is always valid.
//  Created by Jason Mo on 1/20/21.
//

import Foundation


class NetworkHandler {
    

    /*
     basic function to retrieve Employee data without additional inputs being passed in
     */
    func retrieveEmployeeInformation(completionHandler: @escaping ([Employee]?, Error?) -> Void) {
        ServiceLayer.request(router: .retrieveEmployeeInformation) { (result: Result<Data?,Error>) in
            switch result {
            case .success(let data):
                guard let data = data else {
                    
                    completionHandler(nil, nil)
                    return
                    
                }
                
                var targetData: EmployeeDictionary?
                do {
                    //Decode the data to turn into our employee structs
                    try targetData = JsonDecoder.decode(data)
                } catch {
                    completionHandler(nil, error)
                }
                
                if let targetData = targetData {
                    completionHandler(targetData.employees, nil)
                } else {
                    completionHandler(nil, nil)
                }
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}

/*/
 Enum used to provide components of URLcomponents for given cases, makes it easier if a query ever needs to be added to the URL
 
 */
private enum Router {
    
    case retrieveEmployeeInformation
    
    var scheme: String {
        switch self {
        case .retrieveEmployeeInformation:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .retrieveEmployeeInformation:
            return "s3.amazonaws.com"
        }
    }
    
    var path: String {
        switch self {
        case .retrieveEmployeeInformation:
            return "/sq-mobile-interview/employees.json"
        }
    }
    
    var method: String {
        switch self {
        case .retrieveEmployeeInformation:
            return "GET"
        }
    }
    /*
     Can implement parameters if given
     
    var parameters: String {
        
    }
     */
}

/*
Service Layer that appends the components of the URL, and sets the httpMethod. Finally uses the url to create a session and grabs the data
 */
private class ServiceLayer {
    class func request(router: Router, completionHandler: @escaping (Result<Data?, Error>) -> ()) {
        var components = URLComponents()
        
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        
        //Check that url is created properly else do not continue
        
        guard let url = components.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
       
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completionHandler(.failure(error))
            }
            completionHandler(.success(data))
        }
        dataTask.resume()
    }
}


/*/
 Decoder for JSON Snake case to traditional camel case
 Taken from my App, FoodMoods
 
 */
private class JsonDecoder {
    class func decode<T: Codable>(_ json: Data) throws -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: json)
    }
}

