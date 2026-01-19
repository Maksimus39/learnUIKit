
import UIKit

class TabView: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        let viewControllers = [
            createTabViewController(
                controller: ViewController(),
                title: "Home",
                imageName: "house",
                selectedImageName: "house.fill"
            ),
            createTabViewController(
                controller: ActorDetailsViewController(),
                title: "Profile",
                imageName: "person.crop.circle",
                selectedImageName: "person.crop.circle.fill"
            ),
            createTabViewController(
                controller: MoveDetailsViewController(),
                title: "Movie details",
                imageName: "gearshape",
                selectedImageName: "gearshape.fill"
            )
        ]
        
        tabBar.tintColor = .white
        tabBar.backgroundColor = UIColor(named: "TabBarColor")
        setViewControllers(viewControllers, animated: true)
        tabBarController?.selectedIndex = 0
    }
    
    private func createTabViewController(
        controller: UIViewController,
        title: String,
        imageName: String,
        selectedImageName: String
    ) -> UIViewController {
        let navController = UINavigationController(rootViewController: controller)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.tabBarItem.selectedImage = UIImage(systemName: selectedImageName)
        return navController
    }
}
