//
//  HomeRequestCollection.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import Foundation
import Moya

enum HomeRequestCollection {
    case getCategories
    case getDishes
}

extension HomeRequestCollection: TargetType {
    var baseURL: URL {URL(string: Constants.shared.baseURL)!}
    
    var path: String {
        switch self {
        case .getCategories:
            return "/058729bd-1402-4578-88de-265481fd7d54"
        case .getDishes:
            return "/aba7ecaa-0a70-453b-b62d-0e326c859b3b"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCategories:
            return .get
        case .getDishes:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getCategories:
            return .requestPlain
        case .getDishes:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

