# frozen_string_literal: true
require 'simplecov'
require 'coveralls'
Coveralls.wear!('rails')

SimpleCov.start 'rails' do
  add_filter "app/mailers/application_mailer.rb"
  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/channels/application_cable/connection.rb'
  add_filter 'app/channels/application_cable/channel.rb'

  add_group "Services", ["app/services"]
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
  # order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def json(body)
    JSON.parse(body, symbolize_keys: true)
  end
end
