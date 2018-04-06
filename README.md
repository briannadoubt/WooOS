# WooOS

WooOS is a WooCommerce iOS SDK written in Swift. Designed to be intuitive and comprehensive, with most calls from the [WooCommerce REST API] supported to enable downloading the WooCommerce store's data.

PLEASE NOTE: This is beta software. While it is functional this library is not bug free. Please use this code at your own risk!

## Getting Started

WooOS will support Cocoapods in the near future. For now, please copy all files source files into your project.

### Prerequisites

You will require Cocoapods in order to install WooOS. If it is not installed on your system you can do so by running
```
$ sudo gem install cocoapods
```
then in your project folder
```
pod init
```
Make sure you are running your .xcworkspace in your project folder, and not the .xcproject file.

### Installing

Add this to your pod file
```
pod WooOS
```
then run
```
pod install
```
After Cocoapods takes care of adding the files to your project, add
```
import WooOS
```
to the top of each Swift file you that intend to use this library with.

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

* Hat tip to 
