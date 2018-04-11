# WooOS

WooOS is a WooCommerce iOS SDK written in Swift. Designed to be intuitive and comprehensive, with most calls from the [WooCommerce REST API](http://woocommerce.github.io/woocommerce-rest-api-docs/) supported to enable downloading the WooCommerce store's data.

**PLEASE NOTE:** This is beta software. While it is functional this library is not bug free. Please use in production at your own risk, and contribute any fixes found by making a pull request. The help is much appreciated.

## Getting Started

WooOS will support Cocoapods in the near future. For now, please copy all files source files into your project.

### Prerequisites

* Xcode 9+
* Swift 4+
* An active WooCommerce store running on a live Wordpress site

#### Cocoapods

**PLEASE NOTE:** Cocoapods does not work yet. This is a coming feature. For now, please download all the \*.swift files and import them into your project.

You will require Cocoapods in order to embed WooOS into your Xcode project. If it is not installed on your system you can do so by running
```
$ sudo gem install cocoapods
```
then in your project folder
```
pod init
```
After a successful install, and in your Xcode project folder, make sure to open your .xcworkspace and not your .xcproject file.

#### WooCommerce and Wordpress

You will need an active WooCommerce store on a live Wordpress site in order for this SDK to work. Please make sure that you have set up an SSL certificate and are transmitting with all the standards of Apple's App Transport Security protocols.

### Installing

**PLEASE NOTE:** Cocoapods does not work yet. This is a coming feature. For now, please download all the \*.swift files and import them into your project.

Add this to your pod file
```
pod WooOS
```
then run
```
pod install
```
After Cocoapods takes care of adding the files to your project, add `import WooOS` to the top of each Swift file you that intend to use this library with.

### Usage (Unfinished)



### Built With

* [Alamofire](https://github.com/Alamofire/Alamofire/) - Elegant HTTP Networking in Swift
* [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper/) - ObjectMapper is a framework written in Swift that makes it easy for you to convert your model objects (classes and structs) to and from JSON.

HEAVILY INSPIRED BY AND ADAPTED FROM
* [WooCommerceSDK](https://github.com/minhcasi/WooCommerceSDK) - WooCommerce SDK for iOS, OS X, tvOS and watchOS, written purely in Swift.

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/bornbrie/WooOS/tags). 

### Authors

* **Brianna Lee** - *Initial work* - [Owly Design](https://owly.xyz) - [EightfoldYOGA](https://www.eightfold.yoga)

See also the list of [contributors](https://github.com/bornbrie/WooOS/contributors) who participated in this project.

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments (Unfinished)

* Hat tip to...
