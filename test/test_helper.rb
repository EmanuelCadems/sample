# frozen_string_literal: true
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter "app/mailers/application_mailer.rb"
  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/channels/application_cable/connection.rb'
  add_filter 'app/channels/application_cable/channel.rb'
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# require 'webmock/minitest'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
  # order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def json(body)
    JSON.parse(body, symbolize_keys: true)
  end
end
