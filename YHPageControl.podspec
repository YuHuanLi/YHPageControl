Pod::Spec.new do |s|
 s.name         = "YHPageControl"
 s.version      = "1.0.0"
 s.summary      = "A single PageControl easy to ues for iOS"
 s.homepage     = "https://github.com/YuHuanLi/YHPageControl"
 s.license      = { :type => 'MIT', :file => 'LICENSE' }
 s.author       = { "YuHuanLi" => "363474576@qq.com" }
 s.platform     = :ios, '8.0'
 s.source       = { :git => "https://github.com/YuHuanLi/YHPageControl.git", :tag => s.version.to_s }
 s.source_files  = 'YHPageControl', 'YHPageControl/**/*.{h,m}'
 s.requires_arc = true
 end
