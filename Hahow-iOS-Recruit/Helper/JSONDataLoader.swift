//
//  JSONDataLoader.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import Foundation
import RxCocoa
import RxSwift

class JSONDataLoader: DataLoaderProtocol {
    
    private let fileName = "data.json"
    
    private lazy var fileURL: URL? = {
        guard let path = Bundle.main.path(forResource: fileName, ofType: nil) else { return nil }
        return URL(fileURLWithPath: path)
    }()
    
    private lazy var decoder = JSONDecoder()
    
    private let modelsRelay = BehaviorRelay<[CategoryModel]>(value: [])
    
    private(set) lazy var models = modelsRelay.asObservable()
    
    func load() {
        guard let fileURL = fileURL else { return }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let jsonModel = try decoder.decode(AllJSONModel.self, from: data)
            modelsRelay.accept(jsonModel.data)
        } catch {
            print("\(error)")
        }
    }
    
    deinit {
        print("deinit.")
    }
}
