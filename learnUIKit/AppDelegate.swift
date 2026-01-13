import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Создаем window вручную
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Создаем ваш ViewController
        let viewController = ViewController()
        
        // Создаем NavigationController если нужно
        let navigationController = UINavigationController(rootViewController: viewController)
        
        // Устанавливаем как корневой
        window?.rootViewController = navigationController // или просто viewController
        
        // Показываем window
        window?.makeKeyAndVisible()
        
        return true
    }
}
