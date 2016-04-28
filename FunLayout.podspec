Pod::Spec.new do |s|
  s.name         = "FunLayout"
  s.version      = "1.0.3"
  s.summary      = "funny auto layout"

  s.description  = <<-DESC
                  FunLayout help you with autoLayout
                   DESC

  s.homepage     = "https://github.com/Sroik/FunLayout"

  s.license      =  {:type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Sroik" => "Sroik1994@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/Sroik/FunLayout.git", :tag => "1.0.3" }
  s.framework = "UIKit"
  s.source_files  =  "src/FunLayout/FunLayoutModule/*.{swift}"

end
