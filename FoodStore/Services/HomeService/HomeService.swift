//
//  HomeService.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import Foundation
import Moya
import Combine
import CombineMoya

protocol HomeService {
    func getCategories() -> AnyPublisher<[Category], MoyaError>
    func getDishes() -> AnyPublisher<[Dish], MoyaError>
}

final class HomeServiceImpl: HomeService {
    private let provider = MoyaProvider<HomeRequestCollection>()
    
    func getCategories() -> AnyPublisher<[Category], Moya.MoyaError> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return provider.requestPublisher(.getCategories)
            .map(CategoriesModel.self, using: decoder)
            .map { $0.сategories }
            .eraseToAnyPublisher()
    }
    
    func getDishes() -> AnyPublisher<[Dish], Moya.MoyaError> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return provider.requestPublisher(.getDishes)
            .map(DishesModel.self, using: decoder)
            .map { $0.dishes }
            .eraseToAnyPublisher()
    }
}
