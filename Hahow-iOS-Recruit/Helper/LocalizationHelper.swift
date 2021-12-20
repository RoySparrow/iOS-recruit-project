//
//  LocalizationHelper.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/20.
//

import Foundation

/// 處理在地化資料的 helper
class LocalizationHelper {
    
    // iOS 其實有提供原生的 Localizations 功能，只是資料都存放在 local 的話，會有許多不便⋯⋯
    // 例如：萬一設定錯了，要改就要重新上版；如果資料眾多要外包翻譯，local 的格式也不好整理
    // 比較好一點的做法是 server 會有一份翻譯對照表，app launch 時去抓並快取起來用
    // 至於課程、老師名稱等動態文案，需要跟 backend、PM 討論作法，這邊主要處理的是按鈕、頁面標題或其他不太會變的文案
    
    // 設成 private 是因為這個 struct，目前只有 helper 自己 cache 用，不需要讓外部知道它的存在
    private struct LocalizedModel {
        let chineseTraditional: String
        let english: String
    }
    
    // 語系的做法有多種，例如去抓裝置的地區或顯示的語言，看詳細的需求是什麼（找 PM 討論）
    // 如果是自動抓裝置的設定，會少了一些彈性，例如：人在英國卻想看中文的介面；不能在 app 內隨意切換等等
    // 因此這邊是採用由使用者在 app 內決定的方式去設計
    enum Language {
        case chineseTraditional
        case english
    }
    
    // 一般來說要做在地化顯示，就是整支 app 一起，instance 存活時間與 app 一致，故採用 Singleton
    static let shared = LocalizationHelper()
    
    private init() {
        
        // 純示範，資料來源可能是別的地方
        localizedModelDic["launching"] = LocalizedModel(chineseTraditional: "讀取中", english: "Launching")
        localizedModelDic["programming"] = LocalizedModel(chineseTraditional: "程式", english: "Programming")
        localizedModelDic["design"] = LocalizedModel(chineseTraditional: "設計", english: "Design")
        localizedModelDic["language"] = LocalizedModel(chineseTraditional: "語言", english: "Language")
        localizedModelDic["music"] = LocalizedModel(chineseTraditional: "音樂", english: "Music")
    }
    
    private var localizedModelDic: [String: LocalizedModel] = [:]
    
    func getLocalizedString(key: String, with language: Language = .chineseTraditional) -> String? {
        guard let model = localizedModelDic[key] else { return nil }
        
        switch language {
        case .chineseTraditional:
            return model.chineseTraditional
        default:
            return model.english
        }
    }
}
