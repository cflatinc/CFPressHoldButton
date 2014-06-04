Pod::Spec.new do |s|
  s.name         = "CFPressHoldButton"
  s.version      = "0.1.1"
  s.summary      = "Press and hold button for iOS"
  s.homepage     = "https://github.com/cflatinc/CFPressHoldButton"
  s.license      = {:type => "MIT"}
  s.author       = {"ohno" => "ohno@cflat-inc.com"}
  s.platform     = :ios
  s.source       = { :git => "https://github.com/cflatinc/CFPressHoldButton.git", :tag => "0.1.1" }
  s.source_files = "Classes", "Classes/**/*.{h,m}"
  s.public_header_files = "Classes/**/*.h"
  s.requires_arc = true

end
