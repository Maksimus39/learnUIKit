import Foundation

struct SettingCellTableItem {
    var icon: String
    var title: String
    
    static  func settingCellTableItemMock() -> [SettingCellTableItem] {
        [
            SettingCellTableItem(icon: "figure.stand", title: "User 1"),
            SettingCellTableItem(icon: "figure.seated.side.right.child.lap", title: "User 2"),
            SettingCellTableItem(icon: "figure.2.and.child.holdinghands", title: "User 3"),
            SettingCellTableItem(icon: "figure", title: "User 4"),
            SettingCellTableItem(icon: "figure.walk", title: "User 5"),
            SettingCellTableItem(icon: "figure.walk.suitcase.rolling", title: "User 6"),
            SettingCellTableItem(icon: "figure.fall", title: "User 7"),
            SettingCellTableItem(icon: "figure.archery", title: "User 8"),
        ]
    }
}



