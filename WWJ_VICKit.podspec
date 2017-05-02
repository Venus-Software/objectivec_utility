
Pod::Spec.new do |s|

  s.name         = "WWJ_VICKit"
  s.version      = "0.0.1"
  s.summary      = "WWJ_VICKit."
  s.homepage     = "https://github.com/Venus-Software/objectivec_utility"
  s.license      = "MIT"
  s.author       = { "sswimp" => "754612130@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Venus-Software/objectivec_utility.git", :tag => s.version }
  s.source_files = 'WWJ_VICKit/**/*.{h,m}'
  s.public_header_files = 'WWJ_VICKit/**/*.h'
  s.requires_arc = true

  s.subspec 'VICCategory' do |ss|
    ss.source_files = 'WWJ_VICKit/VICCategory/**/*.{h,m}'
    ss.public_header_files = 'WWJ_VICKit/VICCategory/**/*.h'
  end
  
  s.subspec 'WWJ_NODataView' do |ss|
    ss.source_files = 'WWJ_VICKit/WWJ_NODataView/**/*.{h,m}'
    ss.public_header_files = 'WWJ_VICKit/WWJ_NODataView/**/*.h'
  end

end