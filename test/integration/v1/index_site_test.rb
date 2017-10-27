require 'test_helper'
module V1
  class IndexSiteTest < ActionDispatch::IntegrationTest
    test "Index content inside url" do
      post '/v1/sites',
        params: {
          site: {
            url: 'http://localhost:3000/sample'
          }
        }
      assert_equal 201, response.status
      assert_equal Mime::Type.lookup('application/json'), response.content_type
      site = json(response.body)
      assert_equal 'http://localhost:3000/sample', site['url']
      assert_equal "Emanuel Alarcón\nBackend Developer Ruby on Rails\nSystem Engineer\nhttps://www.linkedin.com/in/emanuel-alarcon\nhttps://github.com/EmanuelCadems\n", site['content']
    end
  end
end
