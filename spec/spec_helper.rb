require 'rspec/json_expectations'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.order = :random
  config.include FactoryGirl::Syntax::Methods

  Kernel.srand config.seed

  config.before(:all) do
    FactoryGirl.reload
  end

end
