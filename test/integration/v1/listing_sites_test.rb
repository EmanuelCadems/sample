require 'test_helper'

module V1
  class ListingSitesTest < ActionDispatch::IntegrationTest
    setup do
      @site = Site.create!(url: 'http://localhost:3000/sample')
    end

    test "resturns a list of indexed sites" do
      get '/v1/sites'

      assert_equal 200, response.status
      assert_equal Mime::Type.lookup('application/json'), response.content_type
      assert_equal Site.all.to_json, response.body
    end
  end
end
