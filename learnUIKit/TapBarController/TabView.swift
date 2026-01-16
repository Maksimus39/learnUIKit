import UIKit

class TabView: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let viewControllers = [
            createTabViewController(
                controller: ViewController(),
                title: "Home",
                imageName: "house",
                selectedImageName: "house.fill"
            ),
            createTabViewController(
                controller: SecondViewController(),
                title: "Profile",
                imageName: "person.crop.circle",
                selectedImageName: "person.crop.circle.fill"
            ),
            createTabViewController(
                controller: ThirdViewController(),
                title: "Settings",
                imageName: "gearshape",
                selectedImageName: "gearshape.fill"
            )
        ]
        tabBar.backgroundColor = .orange
        setViewControllers(viewControllers, animated: true)
    }
    
    private func createTabViewController(
        controller: UIViewController,
        title: String,
        imageName: String,
        selectedImageName: String
    ) -> UIViewController {
        let navController = controller
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.tabBarItem.selectedImage = UIImage(systemName: selectedImageName)
        return navController
    }
}
