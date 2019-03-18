Pod::Spec.new do |spec|
spec.name = "WooOS"
spec.version = "0.1.15"
spec.swift_version = '4.0'
spec.cocoapods_version = '>= 0.36'
spec.authors = { "Brianna Lee" => 'bornbrie@icloud.com' }
spec.license = { type: 'MIT', file: 'LICENSE' }
spec.homepage = "https://github.com/bornbrie/WooOS"
spec.source = { git: "https://github.com/bornbrie/WooOS.git", tag: "v#{spec.version}", submodules: true }
spec.summary = "WooCommerce Swift SDK for iOS, tvOS, watchOS, and macOS."

spec.ios.deployment_target = '9.3'
spec.watchos.deployment_target = '2.0'
spec.tvos.deployment_target = '9.0'
spec.macos.deployment_target = '10.11'

spec.dependency 'Alamofire', '~> 4.6'
spec.dependency 'ObjectMapper', '~> 3.0'
spec.dependency 'Locksmith'
spec.ios.dependency 'BraintreeDropIn'
spec.requires_arc = true
spec.ios.framework  = 'UIKit'

spec.source_files = "WooOS/**/*.{h,swift}"

end
