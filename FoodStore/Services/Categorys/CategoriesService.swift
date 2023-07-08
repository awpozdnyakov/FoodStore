//
//  CategoriesService.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import Foundation
import Moya
import Combine
import CombineMoya

protocol CategoriesService {
    func getCategories() -> AnyPublisher<CategorysModel, MoyaError>
}

final class CategoriesServiceImpl: CategoriesService {
    private let provider = MoyaProvider<CategorysRequestCollection>()
    func getCategories() -> AnyPublisher<CategorysModel, Moya.MoyaError> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return provider.requestPublisher(.getCategorys)
            .map(CategorysModel.self, using: decoder)
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
//protocol ProfileService {
//    func getProfile() -> AnyPublisher<UserProfileModel, MoyaError>
//    func getPlannedConsultations() -> AnyPublisher<ConsultationsModel, MoyaError>
//    func getFinishedConsultationsCount() -> AnyPublisher<ConcultationsCountModel, MoyaError>
//}
//
//struct AuthPlugin: PluginType {
//    let token: String
//    
//    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
//        var request = request
//        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
//        return request
//    }
//}
//
//// TODO: - Вынести сброрку плагина в отдельную сущность + убрать явно токен
//
//final class ProfileServiceImpl: ProfileService {
//    
//    private let provider = MoyaProvider<ProfileRequestCollection>(plugins: [AuthPlugin(token: Constants.shared.token!.access)])
//    
//    func getProfile() -> AnyPublisher<UserProfileModel, Moya.MoyaError> {
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        
//        return provider.requestPublisher(.getProfile)
//            .map(UserProfileModel.self, using: decoder)
//            .map { $0 }
//            .eraseToAnyPublisher()
//    }
