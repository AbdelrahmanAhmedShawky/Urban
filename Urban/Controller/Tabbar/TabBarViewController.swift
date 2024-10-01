//
//  TabBarViewController.swift
//  Disraption
//
//  Created by Adnan Sohail on 02/04/2024.
//

import FirebaseCore
import FirebaseMessaging
import FirebaseDatabase
import UIKit
import Firebase

class TabbarController: UITabBarController {

    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFF3E2")
        return view
    }()

    var customTabBarView: UIView = UIView()
    var userData: User?
//    let centerButton = UIButton(type: .custom)

    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    // Set attributes as you need here
    private lazy var indicatorWidth: Double = tabBar.bounds.width / CGFloat(tabBar.items?.count ?? 1)
    private var indicatorColor: UIColor = UIColor(hex: "#FFF3E2") ?? .black

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        self.delegate = self

        setupTabbar()
//        addCustomTabBarView()
//        addCenterItem()
        addViewControllers()
        if let firstTab = self.viewControllers?.first {
            firstTab.tabBarItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 5, right: 0)
        }
        
        tabBar.addSubview(indicatorView)
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
    }

    @objc func methodOfReceivedNotification(notification: Notification) {
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        updateTabbarFrame()

        if #available(iOS 13, *) {
            self.tabBar.standardAppearance.shadowImage = nil
            self.tabBar.standardAppearance.shadowColor = nil
            self.tabBar.unselectedItemTintColor = UIColor(hex: "141414")?.withAlphaComponent(0.6) ?? .black

            self.tabBar.backgroundColor = UIColor(hex: "#FFF3E2") ?? .white
//            self.tabBar.backgroundImage = UIImage()
            self.tabBar.isTranslucent = true
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hex: "141414") ?? .black], for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hex: "141414") ?? .black], for: .selected)
//            UITabBar.appearance().barTintColor = UIColor(hex: "#FFF3E2") ?? .white
            UITabBar.appearance().tintColor = UIColor(hex: "#FFF3E2") ?? .black
            UITabBar.appearance().unselectedItemTintColor = UIColor(hex: "141414") ?? .black
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func setupTabbar() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hex: "141414") ?? .black], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hex: "141414") ?? .black], for: .selected)
//        tabBar.backgroundImage = UIImage()
//        tabBar.shadowImage = UIImage()
    }

//    private func addCustomTabBarView() {
//        let imageView = UIImageView(image: UIImage(named: "tabbar-background"))
//        imageView.layer.shadowColor = UIColor.black.cgColor
//        imageView.layer.shadowOffset = CGSize(width: 0, height: -8.0)
//        imageView.layer.shadowOpacity = 0.10
//        imageView.layer.shadowRadius = 10.0
//
//        let containerStack = UIStackView(arrangedSubviews: [imageView, bottomView])
//        containerStack.axis = .vertical
//
//        customTabBarView = containerStack
//        view.addSubview(customTabBarView)
//        view.bringSubviewToFront(self.tabBar)
//    }

    private func updateTabbarFrame() {
        var bottomOffset: CGFloat = 0
        if view.safeAreaInsets.bottom > 0 {
            bottomOffset = view.safeAreaInsets.bottom - 15
        } else {
            bottomOffset = 32
        }
        tabBar.frame.size.height = tabBar.frame.size.height + bottomOffset
        tabBar.frame.origin.y = tabBar.frame.origin.y - bottomOffset
        customTabBarView.frame = tabBar.frame
    }

    func addViewControllers() {
        self.viewControllers = [home, booking, cart, profile]
    }

//    func addCenterItem() {
//        centerButton.addColorShadow = true
//        centerButton.addTarget(self, action: #selector(centerItemTapped), for: .touchUpInside)
//        centerButton.setBackgroundImage(#imageLiteral(resourceName: "center").withRenderingMode(.alwaysOriginal), for: .normal)
//        centerButton.translatesAutoresizingMaskIntoConstraints = false
//        centerButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        centerButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        view.addSubview(centerButton)
//
//        view.centerXAnchor.constraint(equalTo: centerButton.centerXAnchor).isActive = true
//        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: centerButton.bottomAnchor, constant: tabBar.frame.size.height - 25).isActive = true
//    }

    func hideTabBar() {
        self.tabBar.isHidden = true
//        self.centerButton.isHidden = true
        self.customTabBarView.isHidden = true
    }

    func showTabBar() {
        self.tabBar.isHidden = false
//        self.centerButton.isHidden = false
        self.customTabBarView.isHidden = false
//        centerButtonBringToFront()
    }

    @objc func centerItemTapped() {
        set(selectedIndex: 1)
    }

//    func setCenterSelected() {
//        centerButton.setBackgroundImage(#imageLiteral(resourceName: "center").withRenderingMode(.alwaysOriginal), for: .normal)
//    }
//
//    func setCenterUnselected() {
//        centerButton.setBackgroundImage(#imageLiteral(resourceName: "center").withRenderingMode(.alwaysOriginal), for: .normal)
//    }
    
//    func centerButtonBringToFront() {
//        self.view.bringSubviewToFront(self.centerButton)
//    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Reset all tab item insets
        tabBarController.viewControllers?.forEach {
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        // Set the selected tab item insets to move image up
        viewController.tabBarItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 5, right: 0)
    }

    func set(selectedIndex index: Int) {
        let view = self.tabBarController(self, shouldSelect: self.viewControllers![index])
        selectedIndex = index
        NotificationCenter.default.post(name: Notification.Name("ChangeTab"), object: nil)
    }

    var home: UINavigationController {
        let VC = Storyboard.home.instantiate(identifier: HomeViewController.self)
        let tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home-unselected").withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "home-selected").withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        VC.tabBarItem = tabBarItem

        return UINavigationController.init(rootViewController: VC)
    }

    var booking: UINavigationController {
        let VC = Storyboard.booking.instantiate(identifier: BookingViewController.self)
        let tabBarItem = UITabBarItem(title: "Booking", image: #imageLiteral(resourceName: "booking-unselected").withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "booking-selected").withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        VC.tabBarItem = tabBarItem
        return UINavigationController.init(rootViewController: VC)
    }

    var cart: UINavigationController {
        let VC = Storyboard.cart.instantiate(identifier: CartViewController.self)
        let tabBarItem = UITabBarItem(title: "Cart", image: #imageLiteral(resourceName: "cart-unselected").withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "cart-selected").withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        VC.tabBarItem = tabBarItem
        return UINavigationController.init(rootViewController: VC)
    }
    
    var profile: UINavigationController {
        let VC = Storyboard.profile.instantiate(identifier: ProfileViewController.self)
        let tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile-unselected").withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "profile-selected").withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        VC.tabBarItem = tabBarItem
        return UINavigationController.init(rootViewController: VC)
    }
}

extension TabbarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        setCenterUnselected()
        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TabbarTransition(viewControllers: tabBarController.viewControllers)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let items = tabBar.items else { return }
        print(items.firstIndex(of: item) ?? 0)
    }
}

