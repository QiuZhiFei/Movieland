source 'https://github.com/CocoaPods/Specs.git'

# CocoaPods Keys

plugin 'cocoapods-keys', {
  :project => "Movieland",
  :target => "Movieland",
  :keys => [
    "TheMovieDataBaseApiKey"
  ]
}

# Pod configuration

platform :ios, '8.0'

use_frameworks!

target 'Movieland' do
    pod 'Alamofire', '~> 3.1.3'         # Elegant HTTP Networking in Swift
    pod 'Result', '~> 1.0.0'            # Swift type modelling the success/failure of arbitrary operations
    pod 'SwiftyJSON', '~> 2.3.2'		# SwiftyJSON makes it easy to deal with JSON data in Swift
end

target 'MovielandTests' do
	pod 'Quick', '~> 0.8.0'             # BDD framework for Swift and Objective-C
	pod 'Nimble', '~> 3.0.0'            # A Matcher Framework for Swift and Objective-C
end

target 'MovielandUITests' do

end

