import UIKit

struct CoreAppData: Identifiable {
    
    let id: String = UUID().uuidString
    let items: [CollectionItemCompositionLayoutModel]
    
    static func mockAppData() -> [CoreAppData] {
        
        let storyItems = [
            CollectionItemCompositionLayoutModel(image: "Matthew McConaughey", name: "Matthew McConaughey"),
            CollectionItemCompositionLayoutModel(image: "Anne Hathaway", name: "Anne Hathaway"),
            CollectionItemCompositionLayoutModel(image: "Jessica Chastain", name: "Jessica Chastain"),
            CollectionItemCompositionLayoutModel(image: "Mackenzie Foy", name: "Mackenzie Foy"),
            CollectionItemCompositionLayoutModel(image: "Michael Caine", name: "Michael Caine"),
            CollectionItemCompositionLayoutModel(image: "David Jesy", name: "David Jesy"),
            CollectionItemCompositionLayoutModel(image: "Wes Bentley", name: "Wes Bentley"),
            CollectionItemCompositionLayoutModel(image: "Casey Affleck", name: "Casey Affleck"),
            CollectionItemCompositionLayoutModel(image: "John Lithgow", name: "John Lithgow"),
            CollectionItemCompositionLayoutModel(image: "Matt Damon", name: "Matt Damon"),
            CollectionItemCompositionLayoutModel(image: "Topher Grace", name: "Topher Grace"),
            CollectionItemCompositionLayoutModel(image: "Ellen Burstyn", name: "Ellen Burstyn"),
            CollectionItemCompositionLayoutModel(image: "Elies Gabel", name: "Elies Gabel"),
            CollectionItemCompositionLayoutModel(image: "Timothée Chalamet", name: "Timothée Chalamet"),
            CollectionItemCompositionLayoutModel(image: "David Oyelowo", name: "David Oyelowo"),
            CollectionItemCompositionLayoutModel(image: "Collette Wolfe", name: "Collette Wolfe"),
            CollectionItemCompositionLayoutModel(image: "Francis Z. McCarthy", name: "Francis Z. McCarthy"),
            CollectionItemCompositionLayoutModel(image: "Bill Irwin", name: "Bill Irwin"),
            CollectionItemCompositionLayoutModel(image: "Andrew Borba", name: "Andrew Borba"),
            CollectionItemCompositionLayoutModel(image: "William Devane", name: "William Devane"),
            CollectionItemCompositionLayoutModel(image: "Josh Stewart", name: "Josh Stewart"),
            CollectionItemCompositionLayoutModel(image: "Leah Cairns", name: "Leah Cairns"),
            CollectionItemCompositionLayoutModel(image: "Liam Dickinson", name: "Liam Dickinson"),
            CollectionItemCompositionLayoutModel(image: "Flora Nolan", name: "Flora Nolan"),
            CollectionItemCompositionLayoutModel(image: "Jeff Hefner", name: "Jeff Hefner"),
            CollectionItemCompositionLayoutModel(image: "Brooke Smith", name: "Brooke Smith"),
            CollectionItemCompositionLayoutModel(image: "Russ Fega", name: "Russ Fega"),
            CollectionItemCompositionLayoutModel(image: "William Patrick Brown", name: "William Patrick Brown"),
            CollectionItemCompositionLayoutModel(image: "Kiki Leah Campbell", name: "Kiki Leah Campbell"),
            CollectionItemCompositionLayoutModel(image: "Troy Fyhn", name: "Troy Fyhn"),
            CollectionItemCompositionLayoutModel(image: "Benjamin Hardy", name: "Benjamin Hardy"),
            CollectionItemCompositionLayoutModel(image: "Ryan Irving", name: "Ryan Irving"),
            CollectionItemCompositionLayoutModel(image: "Marlon Sanders", name: "Marlon Sanders"),
            CollectionItemCompositionLayoutModel(image: "Christian Van der Heyden", name: "Christian Van der Heyden"),
            CollectionItemCompositionLayoutModel(image: "Joseph Oliveira", name: "Joseph Oliveira"),
            CollectionItemCompositionLayoutModel(image: "Lena Georgas", name: "Lena Georgas"),
        ]
        
        let messageItems = [
            CollectionItemCompositionLayoutModel(image: "Matthew McConaughey", text: "4 ноября, 1969  Скорпион  56 лет"),
            CollectionItemCompositionLayoutModel(image: "Anne Hathaway", text: "12 ноября, 1982 Скорпион 43 года"),
            CollectionItemCompositionLayoutModel(image: "Jessica Chastain", text: "24 марта, 1977  Овен  48 лет"),
            CollectionItemCompositionLayoutModel(image: "Mackenzie Foy", text: "10 ноября, 2000 • Скорпион • 25 лет"),
            CollectionItemCompositionLayoutModel(image: "Michael Caine", text: "14 марта, 1933 • Рыбы • 92 года"),
            CollectionItemCompositionLayoutModel(image: "David Jesy", text: "2 января • Козерог"),
            CollectionItemCompositionLayoutModel(image: "Wes Bentley", text: "4 сентября, 1978 • Дева • 47 лет"),
            CollectionItemCompositionLayoutModel(image: "Casey Affleck", text: "2 августа, 1975 • Лев • 50 лет"),
            CollectionItemCompositionLayoutModel(image: "John Lithgow", text: "19 октября, 1945 • Весы • 80 лет"),
            CollectionItemCompositionLayoutModel(image: "Matt Damon", text: "8 октября, 1970 • Весы • 55 лет"),
            CollectionItemCompositionLayoutModel(image: "Topher Grace", text: "12 июля, 1978 • Рак • 47 лет"),
            CollectionItemCompositionLayoutModel(image: "Ellen Burstyn", text: "7 декабря, 1932 • Стрелец • 93 года"),
            CollectionItemCompositionLayoutModel(image: "Elies Gabel", text: "8 мая, 1983 • Телец • 42 года"),
            CollectionItemCompositionLayoutModel(image: "Timothée Chalamet", text: "27 декабря, 1995 • Козерог • 30 лет"),
            CollectionItemCompositionLayoutModel(image: "David Oyelowo", text: "1 апреля, 1976 • Овен • 49 лет"),
            CollectionItemCompositionLayoutModel(image: "Collette Wolfe", text: "4 апреля, 1980 • Овен • 45 лет"),
            CollectionItemCompositionLayoutModel(image: "Francis Z. McCarthy", text: "15 февраля, 1942 • Водолей • 83 года"),
            CollectionItemCompositionLayoutModel(image: "Bill Irwin", text: "11 апреля, 1950 • Овен • 75 лет"),
            CollectionItemCompositionLayoutModel(image: "Andrew Borba", text: "3 октября, 1964 • Весы • 61 год"),
            CollectionItemCompositionLayoutModel(image: "William Devane", text: "5 сентября, 1937 • Дева • 88 лет"),
            CollectionItemCompositionLayoutModel(image: "Josh Stewart", text: "6 февраля, 1977 • Водолей • 48 лет"),
            CollectionItemCompositionLayoutModel(image: "Leah Cairns", text: "2 июня, 1974 • Близнецы • 51 год"),
            CollectionItemCompositionLayoutModel(image: "Liam Dickinson", text: "-"),
            CollectionItemCompositionLayoutModel(image: "Flora Nolan", text: "-"),
            CollectionItemCompositionLayoutModel(image: "Jeff Hefner", text: "22 июня, 1975 • Рак • 50 лет"),
            CollectionItemCompositionLayoutModel(image: "Brooke Smith", text: "22 мая, 1967 • Близнецы • 58 лет"),
            CollectionItemCompositionLayoutModel(image: "Russ Fega", text: "-"),
            CollectionItemCompositionLayoutModel(image: "William Patrick Brown", text: "5 января, 1980 • Козерог • 46 лет"),
            CollectionItemCompositionLayoutModel(image: "Kiki Leah Campbell", text: "-"),
            CollectionItemCompositionLayoutModel(image: "Troy Fyhn", text: "-"),
            CollectionItemCompositionLayoutModel(image: "Benjamin Hardy", text: "-"),
            CollectionItemCompositionLayoutModel(image: "Ryan Irving", text: "-"),
            CollectionItemCompositionLayoutModel(image: "Marlon Sanders", text: "-"),
            CollectionItemCompositionLayoutModel(image: "Christian Van der Heyden", text: "-"),
            CollectionItemCompositionLayoutModel(image: "Joseph Oliveira", text: "-"),
            CollectionItemCompositionLayoutModel(image: "Lena Georgas", text: "-"),
        ]
        
        let newsItems = [
            CollectionItemCompositionLayoutModel(image: "fon",
                                                 header: "Заголовок",
                                                 text: "Стивен Спилберг был прикреплен к проекту с 2006 года и нанял Джонатана Нолана писать сценарий, но отложил работу и занялся другими фильмами. В 2012, после ухода Спилберга, Джонатан Нолан предложил нанять своего брата Кристофера Нолана в качестве режиссера."),
            CollectionItemCompositionLayoutModel(image: "fon",
                                                 header: "Заголовок",
                                                 text: "Когда Спилберг ещё был прикреплен к проекту в качестве режиссёра, он собирался снимать в главной роли Уилла Смита. Позже, после ухода Спилберга с поста режиссёра, роль отошла Мэттью Макконахи."),
            CollectionItemCompositionLayoutModel(image: "fon",
                                                 header: "Заголовок",
                                                 text: "Это первый фильм Кристофера Нолана, начиная с фильма «Преследование» (1998), снятый без оператора Уолли Пфистера. Вместо Пфистера Нолан нанял оператора Хойте Ван Хойтема."),
            CollectionItemCompositionLayoutModel(image: "fon",
                                                 header: "Заголовок",
                                                 text: "Фильмом изначально занималась студия Paramount. Когда Кристофер Нолан занял место режиссера, студия Warner Bros., которая выпускала его последние фильмы, добилась участия в проекте. В обмен на права по международной дистрибуции, студия Warner Bros. дала студии Paramount права на софинансирование будущих продолжений фильмов «Пятница 13-е» (2009) и «Южный Парк: Большой, длинный, необрезанный» (1999)."),
            CollectionItemCompositionLayoutModel(image: "fon",
                                                 header: "Заголовок",
                                                 text: "Ирфану Кхану была предложена роль в фильме, но он отказался из-за несогласованности расписаний съемок."),
            CollectionItemCompositionLayoutModel(image: "fon",
                                                 header: "Заголовок",
                                                 text: "Кристофер Нолан выбрал на роль Купера Мэттью Макконахи после того, как увидел его игру в фильме «Мад» (2012)."),
            CollectionItemCompositionLayoutModel(image: "fon",
                                                 header: "Заголовок",
                                                 text: "Чтобы предложить Джессике Честейн роль, Кристофер Нолан послал помощника в Ирландию, где она на тот момент снималась в фильме «Фрёкен Юлия» (2014), со сценарием, помеченным водяными знаками с именем актрисы. Честейн не разрешили оставить себе сценарий, после того как она его прочитала."),
            CollectionItemCompositionLayoutModel(image: "fon",
                                                 header: "Заголовок",
                                                 text: "Некоторые «архивные кадры», которые можно увидеть в трейлере, на самом деле были сняты при создании этого фильма, а затем обработаны при помощи визуальных эффектов, чтобы они казались более старыми."),
            CollectionItemCompositionLayoutModel(image: "fon",
                                                 header: "Заголовок",
                                                 text: "Фильм был снят под вымышленным названием «Письмо Флоры». Это название было выбрано в честь дочери Кристофера Нолана, которую зовут Флора."),
            CollectionItemCompositionLayoutModel(image: "fon",
                                                 header: "Заголовок",
                                                 text: "Сценарий основан на научных работах физика-теоретика Кипа Торна."),
            
        ]
        
        let bannerItems = [
            CollectionItemCompositionLayoutModel(image: "img1"),
            CollectionItemCompositionLayoutModel(image: "img2"),
            CollectionItemCompositionLayoutModel(image: "img4"),
            CollectionItemCompositionLayoutModel(image: "img5"),
            CollectionItemCompositionLayoutModel(image: "img6"),
            CollectionItemCompositionLayoutModel(image: "img7"),
            CollectionItemCompositionLayoutModel(image: "img9"),
            CollectionItemCompositionLayoutModel(image: "img10"),
            CollectionItemCompositionLayoutModel(image: "img11"),
            CollectionItemCompositionLayoutModel(image: "img12"),
            CollectionItemCompositionLayoutModel(image: "img14"),
            CollectionItemCompositionLayoutModel(image: "img15"),
            CollectionItemCompositionLayoutModel(image: "img16"),
            CollectionItemCompositionLayoutModel(image: "img17"),
            CollectionItemCompositionLayoutModel(image: "img18"),
            CollectionItemCompositionLayoutModel(image: "img19"),
            CollectionItemCompositionLayoutModel(image: "img20"),
        ]
        
        
        let storySection = CoreAppData(items: storyItems)
        let messageSection = CoreAppData(items: messageItems)
        let newsSection = CoreAppData(items: newsItems)
        let bannerSection = CoreAppData(items: bannerItems)
        
        return [storySection,
                messageSection,
                newsSection,
                bannerSection
        ]
    }
    
}

struct CollectionItemCompositionLayoutModel: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    var header: String? = nil
    var name: String? = nil
    var text: String? = nil
}
