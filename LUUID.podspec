Pod::Spec.new do |s|

  s.name         = "LUUID"
  s.version      = "1.0.0"
  s.summary      = "A clone of Swift.UUID called LUUID because LUUID.uuidString returns a lowercase string to conform to the UUID RFC."

  s.description  = <<-DESC
    This is a clone of Swift.UUID called LUUID because LUUID.uuidString returns a
    lowercase string to conform to the UUID RFC. It has some other minor modifications
    due to being unable to access certain functions from outside of the Swift standard
    library. However, LUUID is a drop-in replacement for Swift.UUID.
                   DESC

  s.homepage     = "https://github.com/benasher44/LUUID"
  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.author             = { "Ben Asher" => "benasher44@gmail.com" }
  s.social_media_url   = "https://twitter.com/benasher44"
  s.platform     = :ios, "10.0"
  s.swift_version = "4.2"
  s.source       = { :git => "https://github.com/benasher44/LUUID.git", :tag => "#{s.version}" }
  s.source_files  = "LUUID/*.swift"
end
