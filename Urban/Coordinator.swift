//
//  BeljwarProvider.swift
//  TemployMe
//
//  Created by zain on 20/05/2024.
//

import UIKit
import SideMenuSwift

struct Coordinator {
    
    static func IntroScreen() {
        let VC = Storyboard.intro.instantiate(identifier: IntroScreenVC.self)
        let navVC = UINavigationController.init(rootViewController: VC)
        UIApplication.shared.setRoot(vc: navVC)
    }
    
    static func gotoTabbar() {
        let tabbarVC = TabbarController()
//        let menuVC =  Storyboard.sidemenu.instantiate(identifier: SidemenuViewController.self)
//        let menuNavVC = UINavigationController(rootViewController: menuVC)
//        let sideMenuVC = SideMenuController(contentViewController: tabbarVC,
//                                            menuViewController: menuNavVC)
        UIApplication.shared.setRoot(vc: tabbarVC)
    }
    
    static func goToRegister(delegate: UIViewController?,dialCode:String?,mobile:String?) {
        let VC = Storyboard.intro.instantiate(identifier: RegisterVC.self)
        VC.dialCode = dialCode  ?? ""
        VC.mobile = mobile ?? ""
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToSetLocation(delegate: UIViewController?) {
        let VC = Storyboard.loc.instantiate(identifier: SetLocation.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    static func goToChooseLocation(delegate: UIViewController?) {
        let VC = Storyboard.loc.instantiate(identifier: ChooseLocationType.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    static func goToMyProfileVC(delegate: UIViewController?) {
        let VC = Storyboard.profile.instantiate(identifier: MyProfileViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToEditProfileVC(delegate: UIViewController?) {
        let VC = Storyboard.profile.instantiate(identifier: editProfileViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToSaveLocationsVC(delegate: UIViewController?) {
        let VC = Storyboard.profile.instantiate(identifier: SavedAddressViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToSearchVC(delegate: UIViewController?) {
        let VC = Storyboard.search.instantiate(identifier: SearchViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToMyRewardsVC(delegate: UIViewController?) {
        let VC = Storyboard.profile.instantiate(identifier: MyRewardsViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToMyWalletVC(delegate: UIViewController?) {
        let VC = Storyboard.profile.instantiate(identifier: MyWalletViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToInviteFriendVC(delegate: UIViewController?) {
        let VC = Storyboard.profile.instantiate(identifier: InviteFriendViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToRechargeWalletVC(delegate: UIViewController?) {
        let VC = Storyboard.profile.instantiate(identifier: RechargeWalletViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToCheckOutVC(delegate: UIViewController?) {
        let VC = Storyboard.cart.instantiate(identifier: CheckOutViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToCongratulationsVC(delegate: UIViewController?) {
        let VC = Storyboard.cart.instantiate(identifier: CongratulationsViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToBookingDetailsVC(delegate: UIViewController?, bookingType: BookingType) {
        let VC = Storyboard.booking.instantiate(identifier: BookingDetailsViewController.self)
        VC.selectedBookingType = bookingType
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToPrivacyPolicyVC(delegate: UIViewController?) {
        let VC = Storyboard.cms.instantiate(identifier: PrivacyPolicyViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToTermsAndConditionsVC(delegate: UIViewController?) {
        let VC = Storyboard.cms.instantiate(identifier: TermAndConditionViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToTrackVC(delegate: UIViewController?) {
        let VC = Storyboard.booking.instantiate(identifier: TrackPartnersViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToSearchResultVC(delegate: UIViewController?) {
        let VC = Storyboard.search.instantiate(identifier: SearchResultViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    ////////////////////////
    static func goToServiceVC(delegate: UIViewController?) {
        let VC = Storyboard.serviceBooking.instantiate(identifier: ServicesVC.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    static func goToServiceDetails(delegate: UIViewController?) {
        let VC = Storyboard.serviceBooking.instantiate(identifier: ServiceDetails.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    static func goToServiceLocation(delegate: UIViewController?,type:String? = nil) {
        let VC = Storyboard.serviceBooking.instantiate(identifier: ServiceLocation.self)
        VC.typeTxt = type ?? ""
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    static func goToServiceTiming(delegate: UIViewController?) {
        let VC = Storyboard.serviceBooking.instantiate(identifier: ServiceTiming.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToNotificationsVC(delegate: UIViewController?) {
        let VC = Storyboard.notifications.instantiate(identifier: NotificationsViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToCleaningChooseDateVC(delegate: UIViewController?) {
        let VC = Storyboard.designing.instantiate(identifier: CleaningChooseDateViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToCleaningChechOutVC(delegate: UIViewController?) {
        let VC = Storyboard.designing.instantiate(identifier: CleaningCheckOutViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    
    static func goToCleaningThankYouVC(delegate: UIViewController?) {
        let VC = Storyboard.designing.instantiate(identifier: CleaningThankYouViewController.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
    static func goToCleaningDetailsVC(delegate: UIViewController?) {
        let VC = Storyboard.designing.instantiate(identifier: CleaningDetailsVC.self)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        delegate?.navigationController?.view.layer.add(transition, forKey: kCATransition)
        delegate?.navigationController?.pushViewController(VC, animated: false)
    }
}
