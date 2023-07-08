//
//  CategorysRequestCollection.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import Foundation
import Moya

enum CategorysRequestCollection {
    case getCategorys
}

extension CategorysRequestCollection: TargetType {
    var baseURL: URL {URL(string: Constants.shared.baseURL)!}
    
    var path: String {
        switch self {
        case .getCategorys:
            return "/058729bd-1402-4578-88de-265481fd7d54"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCategorys:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getCategorys:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

