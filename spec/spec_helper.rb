require 'active_record'
require_relative '../lib/relational'

Dir['lib/**/*.rb'].each { |f| require "./#{f}" }

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: File.join("..", "/support/dummy.sqlite3"))
require_relative "../spec/support/schema.rb"
Dir['spec/support/models/**/*.rb'].each { |f| require "./#{f}" }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

end
