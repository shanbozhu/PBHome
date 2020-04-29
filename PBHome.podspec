Pod::Spec.new do |s|

    s.name          = 'PBHome'
    s.version       = '1.0.2-SNAPSHOT' #framework版本
    s.summary       = 'description of PBHome'
    s.homepage      = 'https://github.com/shanbozhu'
    s.license       = 'MIT'
    s.author        = { 'zhushanbo' => 'zbo@126.com' }
    s.platform      = :ios, '8.0'
    s.requires_arc  = true

    s.source        = { :git => 'https://github.com/shanbozhu/PBHome.git', :tag => '1.0.2' } #分支版本
    #s.source        = { :git => 'https://github.com/shanbozhu/PBHome.git', :tag => s.version }
    #s.source_files  = 'Src/**/*.{h,m}' #当前目录下的Src目录下的所有源码
    s.vendored_frameworks = '*.framework' #当前目录下的PBHome.framework
    s.resources  = '*.framework/*.bundle' #当前目录下的PBHome.framework下的bundle资源

    #每一个分支对应一个framework版本,也可以是多个framework版本

end
