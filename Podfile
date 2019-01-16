# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

def testing_pods
    pod 'Quick', '1.3.2', :inhibit_warnings => true
    pod 'Nimble', '7.3.1', :inhibit_warnings => true
end

def app_pods
  pod 'ReactiveSwift', '4.0.0'
  pod 'ReactiveCocoa', '8.0.2'
  pod 'Result', '4.1.0'

  pod 'PureLayout', '3.1.4'

  pod 'SDWebImage', '4.4.3'
  pod 'Alamofire', '4.7.3'
  pod 'SwiftyJSON', '~> 4.0'
end

# There are no targets called "App" in any Xcode projects
abstract_target 'App' do
  app_pods

  target 'Series' do
      target 'SeriesTests' do
      inherit! :search_paths
      # Pods for testing
      testing_pods

    end
  end

  # # This is used for the playground
  # target 'SeriesFramework' do

  # end
end
