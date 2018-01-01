import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        ServiceProvider.setupServices()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let movieList = MovieListRouterImpl.createMovieListModule()
        
        let navigationController = UINavigationController(rootViewController: movieList)
        
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()

        return true
        
    }
    
}
