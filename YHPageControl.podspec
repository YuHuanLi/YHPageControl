Pod::Spec.new do |s|
s.name = "YHPageControl"
s.version = "1.0.0"
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = "A single PageControl easy to use for iOS."
s.homepage = "https://github.com/YuHuanLi/YHPageControl"
s.author = { "YuHuanLi" => "363474576@qq.com" }
s.source = { :git => "https://github.com/YuHuanLi/YHPageControl.git", :tag => s.version.to_s }
s.requires_arc = true
s.platform = :ios, '8.0'
s.source_files = 'YHPageControl', 'YHPageControl/**/*.{h,m}'
end
