import UIKit

class DetailsViewController: UIViewController {

    let item: TableRow
    
    init(item: TableRow){
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        title = item.title
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
