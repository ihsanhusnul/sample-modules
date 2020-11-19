platform :ios, '11.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'git@git.gitlab.cloud.bukalapak.io:bukalapak/bukalapakiosspecs.git'

plugin 'cocoapods-pod-merge'

target 'sample-modules' do
  use_frameworks!
  
  pod 'MergedPods', path: 'MergedPods/MergedPods'
  
#  pod 'UtilSwift', path: 'MergedPods/UtilSwift'
#  pod 'UtilObjc', path: 'MergedPods/UtilObjc'
#  pod 'UISwift', path: 'MergedPods/UISwift'
#  pod 'Networking', path: 'MergedPods/Networking'
  
  # Pods for sample-modules
##  group 'UtilSwift' do
##    swift_version! '5.0'
#
#    pod 'CocoaLumberjack', { git:  'https://github.com/bl-core-vitals/CocoaLumberjack.git', branch: '3.6.0' }
#    pod 'KeychainSwift', '18.0.0'
#    pod 'RNCryptor', '5.1.0'
#    pod 'SwiftyJSON', '5.0.0'
#    pod 'ObjectMapper', '3.5.1'
#    pod 'DeviceGuru', '6.0.3'
#    pod 'Parchment', { git: 'https://github.com/bl-core-vitals/Parchment.git', branch: '1.7.0.2' }
#    pod 'Swinject', '2.7.1'
#    pod 'RSBarcodes_Swift', { git:  'https://github.com/bl-core-vitals/RSBarcodes_Swift.git', tag: '5.0.1-xcode12' }
##  end
#
##  group 'UtilObjc' do
##    has_dependencies!
#
#    pod 'PINCache', { git: 'https://github.com/bl-core-vitals/PINCache.git', tag: '3.0.1-podMerge' }
#    pod 'PINOperation', { git: 'https://github.com/bl-core-vitals/PINOperation.git', tag: '1.2.0-podMerge' }
#    pod 'PINRemoteImage', { git: 'https://github.com/bl-core-vitals/PINRemoteImage.git', tag: '3.0.1-podMerge' }
#    pod 'SDWebImage', '4.3.3'
#    pod 'iCarousel', '1.8.3'
##  end
#
##  group 'UISwift' do
##    swift_version! '5.0'
#
#    pod 'DeepDiff', '2.3.1'
#    pod 'IQKeyboardManagerSwift', '6.3.0'
#    pod 'lottie-ios', '2.5.2'
##  end
#
##  group 'Networking' do
##    has_dependencies!
#
#    pod 'Alamofire', '4.9.1'
#    pod 'Starscream', '3.1.1'
#    pod 'SwiftPhoenixClient', '1.2.0'
##  end

end

post_install do |installer|
  
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.name == 'Debug'
        if defined?(target.product_type) && target.product_type == "com.apple.product-type.framework"
          config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = "YES"
        end
        
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
      elsif config.name == 'Release'
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Osize'
      end
      
      # CTAssetsPickerController in UIObjc and RSBarcode in UtilSwift
      # for Extension should be turn off extension API only
      if target.name == "UtilObjc" || target.name == "UtilSwift"
        config.build_settings['APPLICATION_EXTENSION_API_ONLY'] = 'NO'
      end
      
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end

pre_install do |installer|
  installer.analysis_result.specifications.each do |specs|
    specs.swift_version = '5.0'
  end
end
