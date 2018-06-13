Pod::Spec.new do |spec|
spec.name = "WooOS"
spec.version = "0.1.12"
spec.summary = "Cross-platform Swift SDK for WooCommerce"
spec.homepage = "https://github.com/bornbrie/WooOS"
spec.license = { type: 'MIT', file: 'LICENSE' }
spec.authors = { "Brianna Lee" => 'bornbrie@icloud.com' }
spec.swift_version = '4.0'

spec.ios.deployment_target = '9.3'
spec.watchos.deployment_target = '2.0'
spec.tvos.deployment_target = '9.0'
spec.macos.deployment_target = '10.11'
spec.requires_arc = true
spec.source = { git: "https://github.com/bornbrie/WooOS.git", tag: "v#{spec.version}", submodules: true }
spec.source_files = "WooOS/**/*.{h,swift}"

spec.dependency 'Alamofire', '~> 4.6'
spec.dependency 'ObjectMapper', '~> 3.0'
spec.dependency 'Locksmith'
spec.dependency 'BraintreeDropIn'

end
