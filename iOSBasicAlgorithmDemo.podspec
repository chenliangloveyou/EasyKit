Pod::Spec.new do |s|
  s.name         = "iOSBasicAlgorithmDemo"
  s.version      = "1.0.0"
  s.summary      = "algorithm for ios"
  s.homepage     = "http://www.jianshu.com/u/81168eb16e74"
  s.license      = "MIT"
  s.authors      = { 'chenliangloveyou' => 'chenliangloveyou@163.com'}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "git@github.com:chenliangloveyou/iOSBasicAlgorithmDemo.git", :tag => s.version }
  s.source_files = 'iOSBasicAlgorithmDemo', 'iOSBasicAlgorithmDemo/**/*.{h,m}'
  s.requires_arc = true
end
