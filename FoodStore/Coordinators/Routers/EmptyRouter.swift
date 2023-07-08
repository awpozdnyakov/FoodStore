//
//  EmptyRouter.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import UIKit
import XCoordinator

final class EmptyRouter<T: Route>: Router {
    var viewController: UIViewController!
    func contextTrigger(_ route: T, with options: TransitionOptions, completion: ContextPresentationHandler?) {}
}
