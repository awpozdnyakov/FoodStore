//
//  PreviewMock.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import XCoordinator

extension UnownedRouter {
    static func previewMock<T: Route>() -> UnownedRouter<T> {
        return UnownedRouter(EmptyRouter<T>(), erase: { StrongRouter<T>($0) })
    }
}
