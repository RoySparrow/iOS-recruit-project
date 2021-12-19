//
//  CourseListViewModel.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import RxCocoa
import RxSwift
import UIKit

class CourseListViewModel: CourseListViewModelProtocol {
    
    private let maxPhoneDisplayCount = 3
    
    private let dataLoader: DataLoaderProtocol = JSONDataLoader()
    
    private let modelsRelay = BehaviorRelay<[CategoryModel]>(value: [])
    
    private(set) lazy var models = modelsRelay.asDriver()
    
    private let disposeBag = DisposeBag()
    
    required init(bindings: CourseListViewModelBindings) {
        bindings.fetch
            .subscribe(onNext: { [weak self] in
                self?.dataLoader.load()
            }).disposed(by: disposeBag)
        
        dataLoader.models
            .subscribe(onNext: { [weak self] models in
                guard let self = self else { return }
                
                let finalModels = UIDevice.currentType == .phone ? self.modifyModelsForPhone(origin: models) : models
                self.modelsRelay.accept(finalModels)
            }).disposed(by: disposeBag)
    }
    
    private func modifyModelsForPhone(origin: [CategoryModel]) -> [CategoryModel] {
        var finalModels: [CategoryModel] = []
        for i in 0..<origin.count {
            var category = origin[i]
            let courseCount = category.courses.count
            if courseCount > maxPhoneDisplayCount {
                category.courses.removeSubrange(maxPhoneDisplayCount..<courseCount)
            }
            finalModels.append(category)
        }
        return finalModels
    }
    
    deinit {
        print("deinit.")
    }
}
