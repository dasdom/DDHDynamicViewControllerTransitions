Pod::Spec.new do |s|
  s.name             = "DDHDynamicViewControllerTransitions"
  s.version          = "0.9.0"
  s.summary          = "View controller transitions using UIDynamics."
  s.homepage         = "https://github.com/dasdom/DDHDynamicViewControllerTransitions"
  s.license          = 'MIT'
  s.author           = { "Dominik Hauser" => "dominik.hauser@dasdom.de" }
  s.source           = { :git => "https://github.com/dasdom/DDHDynamicViewControllerTransitions.git", :tag => s.version.to_s }
  s.screenshots      = [ "https://raw.githubusercontent.com/dasdom/DDHDynamicViewControllerTransitions/master/screencasts/snap.gif", 
                         "https://raw.githubusercontent.com/dasdom/DDHDynamicViewControllerTransitions/master/screencasts/gravity.gif",
			 "https://raw.githubusercontent.com/dasdom/DDHDynamicViewControllerTransitions/master/screencasts/gravity_rotation.gif" ]
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = "DDHNavigationControllerDelegate.{h,m}", "DynamicTransitionAnimators/*.{h,m}" 
end
