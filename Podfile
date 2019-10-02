
install! 'cocoapods',
         :warn_for_multiple_pod_sources => false

target 'WooOS-iOS' do
  use_frameworks!
  platform :ios, '10.0'

  pod 'BraintreeDropIn'
  pod 'Alamofire'
  pod 'Locksmith'

  target 'WooOS-iOSTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'WooOS-macOS' do
  use_frameworks!
  platform :osx, '10.12'

  pod 'Alamofire'
  pod 'Locksmith'

  target 'WooOS-macOSTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'WooOS-tvOS' do
  use_frameworks!
  platform :tvos, '9.0'

  pod 'Alamofire'
  pod 'Locksmith'

  target 'WooOS-tvOSTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'WooOS-watchOS' do
  use_frameworks!
  platform :watchos, '2.0'

  pod 'Alamofire'
  pod 'Locksmith'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |configuration|
            configuration.build_settings['SWIFT_VERSION'] = "4.0"
        end
    end
end
