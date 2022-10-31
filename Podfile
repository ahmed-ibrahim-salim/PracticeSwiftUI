# Uncomment the next line to define a global platform for your project
 platform :ios, '14.0'

target 'PractiseSwiftUI' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PractiseSwiftUI

  #pod 'Alamofire'

  target 'PractiseSwiftUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PractiseSwiftUIUITests' do
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
      # some older pods don't support some architectures, anything over iOS 11 resolves that
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
        #config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
        #config.build_settings["ONLY_ACTIVE_ARCH"] = "NO"
      end
    end
  end
  
end
