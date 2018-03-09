require "bundler/setup"
require "pry"
require "locust"
require "rspec/its"

require_relative "support/fixtures_helper.rb"
require_relative "support/matchers.rb"

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.expect_with(:rspec) { |c| c.syntax = :expect }

  config.order = :random
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:each) { Test = Class.new(Module) }
  config.after(:each)  { Object.send :remove_const, :Test }
end
