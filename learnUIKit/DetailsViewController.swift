import UIKit

class DetailsViewController: UIViewController {

    var item: TableData?
    
     init(item: TableData) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
