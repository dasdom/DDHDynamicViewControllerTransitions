# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "DDHDynamicViewControllerTransitions"
  s.version          = "0.1.0"
  s.summary          = "View controller transitions using UIDynamics."
  s.homepage         = "https://github.com/dasdom/DDHDynamicViewControllerTransitions"
  s.license          = 'MIT'
  s.author           = { "Dominik Hauser" => "dominik.hauser@dasdom.de" }
  s.source           = { :git => "https://github.com/dasdom/DDHDynamicViewControllerTransitions.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
end
