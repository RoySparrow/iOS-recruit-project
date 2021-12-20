# iOS-recruit-project
#### 建置環境

+ Xcode 12.5 開發
+ 主要語言 Swift
+ 最低支援版本 iOS 13.0
+ 三方管理採用 SPM

#### 三方套件

+ RxSwift：藉由資料流的概念，實現 data binding
+ SnapKit：簡化設定 constraints 的繁瑣流程
+ Kingfisher：用來處理圖片的讀取與顯示

#### 說明

+ Layout by code
  + 在多人協作時比較好 merge，也可以避免複雜的畫面設定散落在各個 xib 和 storyboard
+ 開啟 app 的流程
  + `點擊 app > LaunchVC > 其他頁面`
  + 在進入 app 主畫面前通常都會有些事情要處理，例如：檢查是否需要版更、連線狀況等等，因此預留了 LaunchVC 來做
+ 關於 DataLoaderProtocol 和 ViewModelProtocol
  + 讓使用的 class 可以依賴抽象，方便之後抽換
+ iPhone 和 iPad 使用不同的 VC 來顯示
  + 由於 iPhone 和 iPad 的顯示差異不小，決定拆成兩個 VC，以免後續兩邊差更多時難以維護
