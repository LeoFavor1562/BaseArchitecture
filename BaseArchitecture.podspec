
Pod::Spec.new do |spec|

spec.name         = "BaseArchitecture"
spec.version      = "0.0.1"
spec.summary      = "基础版本库"
spec.description  = <<-DESC
包含了基础架构和网络请求
DESC

spec.homepage     = "https://github.com/LeoFavor1562/BaseArchitecture"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author             = { "18610011562@163.com" => "LeoFavor" }
spec.platform     = :ios, "8.0"
spec.source       = { :git => "https://github.com/LeoFavor1562/BaseArchitecture.git", :tag => "#{spec.version}" }
spec.source_files  = "BaseArchitecture/BaseHeader.h", "BaseArchitecture/BaseDefine.h", "BaseArchitecture/BaseCompnent/*.{h,m}", "BaseArchitecture/BaseNetwork/*.{h,m}", "BaseArchitecture/BaseStructure/*.{h,m}"
#spec.public_header_files = "BaseArchitecture/BaseHeader.h"
spec.requires_arc = true
spec.xcconfig = { "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" }
spec.dependency "AFNetworking", "~> 3.0"
spec.dependency "MJExtension", "~> 3.0.15.1"

#spec.subspec 'BaseCompnent' do |sp|
#sp.source_files = 'BaseArchitecture/BaseCompnent/*.{h,m}'
#end

#spec.subspec 'BaseNetwork' do |sp|
#sp.source_files = 'BaseArchitecture/BaseNetwork/*.{h,m}'
#end

#spec.subspec 'BaseStructure' do |sp|
#sp.source_files = 'BaseArchitecture/BaseStructure/*.{h,m}'
#end

end
