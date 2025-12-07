import Foundation

struct SecondSettingCellTableItem {
    var icon: String
    var title: String
    var someText: String
    
    static func secondSettingCellTableItemMock() -> [SecondSettingCellTableItem]{
        [
            SecondSettingCellTableItem(icon: "at", title: "Group - 1", someText: "someText - 1"),
            SecondSettingCellTableItem(icon: "at.badge.minus", title: "Group - 2", someText: "someText - 2"),
            SecondSettingCellTableItem(icon: "exclamationmark.shield.fill", title: "Group - 3", someText: "someText - 3"),
            SecondSettingCellTableItem(icon: "xmark.circle", title: "Group - 4", someText: "someText - 4"),
        ]
    }
}
