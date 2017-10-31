# frozen_string_literal: true

require 'test_helper'

module V1
  class ListingSitesTest < ActionDispatch::IntegrationTest
    setup do
      4.times { Site.create!(url: 'http://localhost:3000/sample') }
    end

    test 'resturns a list of indexed sites' do
      get '/v1/sites'

      assert_equal 200, response.status
      assert_equal Mime::Type.lookup('application/json'), response.content_type
      assert_equal Site
        .select(:id, :url, :content, :created_at)
        .to_json, response.body
    end

    test 'returns the second page with 2 sites per page' do
      get '/v1/sites?page=2&per_page=2'

      assert_equal 200, response.status
      assert_equal Mime::Type.lookup('application/json'), response.content_type
      assert_equal 2, json(response.body).count
    end
  end
end
