//
//  TestAPI.swift
//  Fortunesoft_Test
//
//  Created by Mac on 25/04/23.
//

import Alamofire
import SwiftyJSON
import PromiseKit

class APIManager{
    
    class var sharedInstance: APIManager {
        struct Singleton {
            static let instance = APIManager()
        }
        return Singleton.instance
    }
    func getData() -> Promise<TestModel>
    {
        return Promise
        {
            resolver in
            
            AF.request("https://test.dev-fsit.com/api/image-list",method:.get,parameters:nil,encoding:JSONEncoding.default).responseString { response in
                
                print("REQUEST:",response.request?.description ?? "")
                
                switch response.result
                {
                case.success(let data):
                    if let json = data.data(using: .utf8)
                    {
                        do
                        {
                            let a = try JSONDecoder().decode(TestModel.self,from: json)
                            resolver.fulfill(a)
                        }
                        catch let err
                        {
                            print("JSONDecoder Error:\n",err)
                        }
                    }
                   
                case .failure(let error):
                    
                    resolver.reject(error)
                    print("network error:",error)
                }
                
            }
            
        }
        
    }
    
}

