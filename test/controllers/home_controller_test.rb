# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get sample' do
    get sample_url
    assert_response :success
  end
end
