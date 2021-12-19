//
//  JSONDataLoader.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import Foundation
import RxCocoa
import RxSwift

/// 負責 JSON 檔案的讀取跟快取，如果使用這個 loader 的各頁面有統一的資料處理邏輯，就做在這。反之，由各頁面的 ViewModel 自行處理
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
            let jsonModel = try decoder.decode(AllCategoryModel.self, from: data)
            modelsRelay.accept(jsonModel.data)
        } catch {
            print("\(error)")
        }
    }
    
    deinit {
        print("deinit.")
    }
}
