//
//  TestModel.swift
//  Fortunesoft_Test
//
//  Created by Mac on 25/04/23.
//

import Foundation
import Foundation

struct TestModel:Decodable{
    
    var status=Int()
    var data:[Data]
}

struct Data:Decodable{
    
    var title=String()
    var image=String()
}
