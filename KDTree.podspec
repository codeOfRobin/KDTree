#
# Be sure to run `pod lib lint KDTree.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "KDTree"
  s.version          = "0.1.0"
  s.summary          = "A space-partitioning data structure."
  s.description      = <<-DESC
k-dimensional tree, a space-partitioning data structure, in Swift.

Particularly useful data structure for clustering coordinates.
                       DESC

  s.homepage         = "https://github.com/ashare80/KDTree"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Adam Share" => "ashare80@gmail.com" }
  s.source           = { :git => "https://github.com/ashare80/KDTree.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/adamshare>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Source/**/*'
end
