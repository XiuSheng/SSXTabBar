#
# Be sure to run `pod lib lint SSXTabBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SSXTabBar'
  s.version          = '0.1.0'
  s.summary          = '一个自定义可滑动的TabBar.tabBar的item超过5个，如6个时，可滑动控制'


  s.description      = <<-DESC
当tabBar上的item超过5个的时候后面的会合并成tabbar的第五个，看起来十分的不美观，所以不如把TabBar做成可以左右滑动可以看见更后面的的item，6个的时候或者更多都可以用这个自定义的TabBar来实现，如果是五个或者少于五个的时候用此TabBar也不会有任何的影响。
                       DESC

  s.homepage         = 'https://github.com/XiuSheng/SSXTabBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sishengxiu@gmail.com' => 'sishengxiu@gmail.com' }
  s.source           = { :git => 'https://github.com/XiuSheng/SSXTabBar.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'SSXTabBar/Classes/**/*'
  s.frameworks = 'UIKit'
end
