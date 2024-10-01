# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Urban' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Urban
pod 'Firebase/Core'
  pod 'Firebase/Database'
  pod 'Firebase/Messaging'
  pod 'Firebase/Auth'
  pod 'Firebase/Crashlytics'
  pod 'IQKeyboardManager'
  pod 'ImageSlideshow'
  pod 'ImageSlideshow/Alamofire'
  pod 'KMPlaceholderTextView', '~> 1.4.0'
  pod 'Alamofire', '~> 5.0'
  pod 'NVActivityIndicatorView'
  pod 'SDWebImage'
  pod 'IQKeyboardManager'
  pod 'Firebase/Core'
  pod 'Firebase/Database'
  pod 'Firebase/Messaging'
  pod 'Firebase/Auth'
  pod 'Firebase/Crashlytics'
  pod 'CHIPageControl/Jaloro'
  pod 'FaveButton'
  pod "PWSwitch"
  pod 'DatePickerDialog'
  pod 'YLProgressBar'
  pod 'DropDown'
  pod 'GooglePlaces', '~> 3.9.0'
  pod 'GoogleMaps', '~> 3.9.0'
  pod 'GoogleSignIn'
  pod 'Stripe', '~> 22.8.2'
  pod 'Cosmos'
  pod 'FittedSheets'
  pod 'SwiftKeychainWrapper'
  pod 'STRatingControl'
  pod 'Siren'
  pod 'CountryPickerView'
  pod 'DPOTPView'
  pod 'HSAttachmentPicker'
  pod 'OpalImagePicker'
  pod 'GrowingTextView', '0.6.1'
  pod 'SCLAlertView'
  pod 'ImageViewer.swift'
  pod 'SideMenuSwift'
  pod 'Appirater'
  pod 'ADCalenderView'
  pod 'VACalendar'
  pod 'lottie-ios'
  pod 'SVPinView'
  pod 'MultiSlider'
  pod 'KeychainAccess'
  pod 'GSPlayer'
  pod 'WaterfallLayout'
  pod 'CHTCollectionViewWaterfallLayout'
pod 'FSCalendar'

  target 'UrbanTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'UrbanUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
