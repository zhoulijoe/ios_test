platform :ios, '7.1'

if FileTest::directory?('../ios_utils')
    pod 'ZLIUtils', :path => '../ios_utils'
    else
    pod 'ZLIUtils', :git => 'https://github.com/zhoulijoe/ios_utils.git', :branch => 'develop'
end

pod 'Typhoon'

target :IOSTestTests, :exclusive => true do
    pod 'Kiwi'
end
