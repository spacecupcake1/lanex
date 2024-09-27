require 'simplecov'
SimpleCov.start 'rails'


ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def login_as(user)
      post login_url, params: { user_name: user.user_name, password: 'password' }
      assert_equal user.id, session[:user_id], "Login failed for user: #{user.user_name}"
    end
  end
end
