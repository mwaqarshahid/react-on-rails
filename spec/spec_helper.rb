# frozen_string_literal: true

require 'simplecov'

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start 'rails' do
  add_filter '/config/'
  add_filter '/spec/'
  add_filter '/vendor/'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.
      include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
