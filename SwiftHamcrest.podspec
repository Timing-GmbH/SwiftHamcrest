Pod::Spec.new do |s|

  s.name         = "SwiftHamcrest"
  s.version      = "2.2.4"
  s.summary      = "Hamcrest test assertions for Swift"

  s.description  = <<-DESC
                   Hamcrest gives you advanced matchers with better error messages for your Swift unit tests.
                   DESC

  s.homepage     = "https://github.com/nschum/SwiftHamcrest"
  s.license      = "BSD"
  s.author       = { "Nikolaj Schumacher" => "me@nschum.de",
                     "René Pirringer" => "rene@openbakery.org" }

  s.ios.deployment_target = "11.0"
  s.osx.deployment_target = "10.15"
  s.tvos.deployment_target = "11.0"

  s.module_name  = "Hamcrest"
  s.source       = { :git => "https://github.com/nschum/SwiftHamcrest.git", :tag => "2.2.4" }
  s.source_files = "Hamcrest/*.swift"
  s.frameworks   = ["Foundation", "XCTest"]
  s.swift_version = '5.0'

  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }

end
