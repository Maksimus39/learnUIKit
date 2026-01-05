import Foundation

struct CollectionSection: Identifiable {
    let id: String = UUID().uuidString
    let items: [CollectionItem]
    
    static func mockdata() -> [CollectionSection] {
        
        let storyItems = [
            CollectionItem(image: "img1" , name: "Name1"),
            CollectionItem(image: "img2" , name: "Name1"),
            CollectionItem(image: "img3" , name: "Name1"),
            CollectionItem(image: "img4" , name: "Name1"),
            CollectionItem(image: "img1" , name: "Name1"),
            CollectionItem(image: "img2" , name: "Name1"),
            CollectionItem(image: "img3" , name: "Name1"),
            CollectionItem(image: "img4" , name: "Name1"),
            CollectionItem(image: "img1" , name: "Name1"),
            CollectionItem(image: "img2" , name: "Name1"),
            CollectionItem(image: "img3" , name: "Name1"),
            CollectionItem(image: "img4" , name: "Name1"),
        ]
        
        let messageItems = [
            CollectionItem(image: "img1", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "img2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "img3", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "img4", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "img5", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
        ]
        
        let newsItems = [
            CollectionItem(image: "news1", header: "Заголовок1", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "news2", header: "Заголовок2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "news2", header: "Заголовок3", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
        ]
        
        let bannerItems = [
            CollectionItem(image: "banner1"),
            CollectionItem(image: "banner2"),
            CollectionItem(image: "banner3"),
        ]
        
        let storySection = CollectionSection(items: storyItems)
        let messageSection = CollectionSection(items: messageItems)
        let newsSection = CollectionSection(items: newsItems)
        let bannerSection = CollectionSection(items: bannerItems)
        
        return [storySection,
                messageSection,
                // newsSection, bannerSection
        ]
    }
}


struct CollectionItem: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    var header: String? = nil
    var name: String? = nil
    var text: String? = nil
}
