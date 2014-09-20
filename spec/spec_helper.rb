ENV['CODECLIMATE_REPO_TOKEN'] = "949c67db423a77a0100c6682d336641fc0c61461d4116d57c5810d3c31fdf38f"
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'coordinate'
require 'robot'
require 'direction'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
