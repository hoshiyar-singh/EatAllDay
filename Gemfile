source "https://rubygems.org"

gem 'danger', '~> 6.0.9'
gem 'danger-swiftlint', '~> 0.22.0'
gem 'fastlane', '~> 2.133.0'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
