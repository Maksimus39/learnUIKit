import Foundation


struct SettingItem {
    var icon: String
    var title: String
    var sub: String
    
    static  func mockData() -> [SettingItem] {
        [
                   SettingItem(icon: "square.and.arrow.up", title: "Main", sub: "General settings"),
                   SettingItem(icon: "square.and.arrow.up.circle", title: "Display", sub: "Brightness and theme"),
                   SettingItem(icon: "square.and.arrow.up.badge.clock", title: "Font", sub: "Text size and style"),
                   SettingItem(icon: "square.and.arrow.down.fill", title: "Notification", sub: "Alerts and sounds"),
                   SettingItem(icon: "pencil", title: "Phone", sub: "Call settings"),
                   SettingItem(icon: "eraser.slash", title: "Laptop", sub: "Device preferences"),
                   SettingItem(icon: "pencil.tip", title: "iPad", sub: "Tablet settings"),
               ]
    }
}


