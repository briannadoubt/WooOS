
Pod::Spec.new do |s|

  s.name         = "wooOS"
  s.version      = "0.1.2"
  s.license = 'MIT'
  s.summary      = "A WooCommerce REST API SDK written in Swift"

  s.description  = <<-DESC
wooOS is designed to be an easy-to-use iOS SDK for developers to easily connect to their WooCommerce store.
                   DESC

  s.homepage     = "http://owly.design/wooOS"
  s.author    = "Brianna Lee"
  s.social_media_url   = "http://twitter.com/bornbrie"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => 'https://github.com/bornbrie/wooOS.git', :tag => s.version }
  s.source_files  = "wooOS/*.swift"

  s.frameworks = 'Alamofire', 'ObjectMapper'
  s.swift_version = "3.2"

end
