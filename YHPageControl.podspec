Pod::Spec.new do |s|
s.name = 'YHPageControl'
s.version = '1.0.0'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'A single PageControl easy to ues in iOS.'
s.homepage = 'https://github.com/YuHuanLi/YHPageControl'
s.authors = { 'YuHuanLi' => '363474576@qq.com' }
s.source = { :git => 'https://github.com/YuHuanLi/YHPageControl.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'YHPageControl/*.{h,m}'
s.resources = 'YHPageControl/**/*.{png,xib}'
end
